terraform {
  backend "s3" {}
}

variable "DOMAIN" {}

variable "NAME" {}

provider "aws" {}

resource "aws_acm_certificate" "da_certificate" {
  domain_name       = "${var.DOMAIN}"
  validation_method = "DNS"

  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_s3_bucket" "da_bucket" {
  bucket        = "${var.NAME}"
  force_destroy = true

  tags {
    Name = "${var.NAME}"
  }

  versioning {
    enabled = true
  }
}

resource "aws_route53_zone" "da_zone" {
  name = "${var.DOMAIN}."

  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_route53_record" "da_record" {
  count   = "${length(aws_acm_certificate.da_certificate.domain_validation_options)}"
  name    = "${lookup(aws_acm_certificate.da_certificate.domain_validation_options[count.index], "resource_record_name")}"
  records = ["${lookup(aws_acm_certificate.da_certificate.domain_validation_options[count.index], "resource_record_value")}"]
  ttl     = 60
  type    = "${lookup(aws_acm_certificate.da_certificate.domain_validation_options[count.index], "resource_record_type")}"
  zone_id = "${aws_route53_zone.da_zone.zone_id}"
}

resource "aws_acm_certificate_validation" "da_validation" {
  certificate_arn         = "${aws_acm_certificate.da_certificate.arn}"
  validation_record_fqdns = ["${aws_route53_record.da_record.*.fqdn}"]
}

resource "aws_iam_role" "da_iam" {
  name = "blog-ecs-task-execution-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "da_attachment" {
  role = "${aws_iam_role.da_iam.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_availability_zones" "da_az" {}

resource "aws_vpc" "da_vpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "da_subnet" {
  count = "${data.aws_availability_zones.da_az.names}"
  cidr_block = "${cidrsubnet(aws_vpc.da_vpc.cidr_block, 8, count.index)}"
  availability_zone = "${data.aws_availability_zones.da_az.names[count.index]}"
  vpc_id = "${aws_vpc.da_vpc.id}"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "da_gateway" {
  vpc_id = "${aws_vpc.da_vpc.id}"
}

resource "aws_route" "da_route" {
  route_table_id = "${aws_vpc.da_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.da_gateway.id}"
}

resource "aws_ecr_repository" "da_repository" {
  name = "${var.NAME}"
}

resource "aws_ecs_cluster" "da_cluster" {
  name = "${var.NAME}"
}

resource "aws_ecs_task_definition" "da_task" {
  container_definitions = <<DEFINITION
[
  {
    "name": "${var.NAME}",
    "image": "${aws_ecr_repository.da_repository.repository_url}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION

  cpu = 512
  execution_role_arn = "${aws_iam_role.da_iam.arn}"
  family = "${var.NAME}"
  memory = 1024
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
}

resource "aws_ecs_service" "da_service" {
  cluster = "${aws_ecs_cluster.da_cluster.id}"
  desired_count = 1
  launch_type = "FARGATE"
  name = "${var.NAME}"
  task_definition = "${aws_ecs_task_definition.da_task.arn}"
  
  network_configuration {
    subnets = ["${aws_subnet.da_subnet.*.id}"]
    assign_public_ip = true
  }
}
