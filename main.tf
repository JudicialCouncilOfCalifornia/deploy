terraform {
  backend "s3" {}
}

variable "DOMAIN" {}

variable "NAME" {}

variable "S3_ID" {}

variable "S3_SECRET" {}

variable "S3_REGION" {}

provider "aws" {}

resource "aws_acm_certificate" "da_certificate" {
  domain_name = "${var.DOMAIN}"
  validation_method = "DNS"

  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_s3_bucket" "da_bucket" {
  bucket = "${var.NAME}"
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
  count = "${length(aws_acm_certificate.da_certificate.domain_validation_options)}"
  name = "${lookup(aws_acm_certificate.da_certificate.domain_validation_options[count.index], "resource_record_name")}"
  records = ["${lookup(aws_acm_certificate.da_certificate.domain_validation_options[count.index], "resource_record_value")}"]
  ttl = 60
  type = "${lookup(aws_acm_certificate.da_certificate.domain_validation_options[count.index], "resource_record_type")}"
  zone_id = "${aws_route53_zone.da_zone.zone_id}"
}

resource "aws_acm_certificate_validation" "da_validation" {
  certificate_arn = "${aws_acm_certificate.da_certificate.arn}"
  validation_record_fqdns = ["${aws_route53_record.da_record.*.fqdn}"]
}

resource "aws_iam_role" "da_iam" {
  name = "${var.NAME}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "da_policy" {
  role = "${aws_iam_role.da_iam.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_availability_zones" "da_azs" {
  state = "available"
}

resource "aws_vpc" "da_vpc" {
  cidr_block = "192.168.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_subnet" "da_subnet_public" {
  count = "${length(data.aws_availability_zones.da_azs.names)}"
  cidr_block = "${cidrsubnet(aws_vpc.da_vpc.cidr_block, 8, count.index)}"
  vpc_id = "${aws_vpc.da_vpc.id}"
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.da_azs.names[count.index]}"

  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_internet_gateway" "da_internet" {
  vpc_id = "${aws_vpc.da_vpc.id}"

  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_route_table" "da_table_public" {
  vpc_id = "${aws_vpc.da_vpc.id}"

  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_route" "da_route_iw" {
  route_table_id = "${aws_route_table.da_table_public.id}"
  gateway_id = "${aws_internet_gateway.da_internet.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "da_assoc_public" {
  count = "${length(data.aws_availability_zones.da_azs.names)}"
  subnet_id = "${element(aws_subnet.da_subnet_public.*.id, count.index)}"
  route_table_id = "${aws_route_table.da_table_public.id}"
}

resource "aws_eip" "da_eip" {
  vpc = true
}

resource "aws_nat_gateway" "da_nat" {
  allocation_id = "${aws_eip.da_eip.id}"
  subnet_id = "${aws_subnet.da_subnet_public.0.id}"
  
  tags {
    Name = "${var.NAME}"
  }
}

resource "aws_subnet" "da_subnet_private" {
  count = "${length(data.aws_availability_zones.da_azs.names)}"
  cidr_block = "${cidrsubnet(aws_vpc.da_vpc.cidr_block, 8, count.index + length(data.aws_availability_zones.da_azs.names))}"
  vpc_id = "${aws_vpc.da_vpc.id}"
  availability_zone = "${data.aws_availability_zones.da_azs.names[count.index]}"

  tags {
    Name = "${var.NAME}"
    Type = "Private"
  }
}

resource "aws_route_table" "da_table_private" {
  vpc_id = "${aws_vpc.da_vpc.id}"

  tags {
    Name = "${var.NAME}"
    Type = "Private"
  }
}

resource "aws_route" "da_route_nat" {
  route_table_id  = "${aws_route_table.da_table_private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.da_nat.id}"
}

resource "aws_route_table_association" "da_assoc_private" {
  count = "${length(data.aws_availability_zones.da_azs.names)}"
  subnet_id = "${element(aws_subnet.da_subnet_private.*.id, count.index)}"
  route_table_id = "${aws_route_table.da_table_private.id}"
}

resource "aws_security_group" "da_security_public" {
  name = "${var.NAME}-public"
  vpc_id = "${aws_vpc.da_vpc.id}"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "da_security_private" {
  name = "${var.NAME}-private"
  vpc_id = "${aws_vpc.da_vpc.id}"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_groups = ["${aws_security_group.da_security_public.id}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "da_lb" {
  name = "${var.NAME}"
  subnets = ["${aws_subnet.da_subnet_public.*.id}"]
  security_groups = ["${aws_security_group.da_security_public.id}"]
}

resource "aws_lb_target_group" "da_target" {
  name = "${var.NAME}"
  port = 80
  protocol = "HTTP"
  vpc_id = "${aws_vpc.da_vpc.id}"
  target_type = "ip"
}

resource "aws_lb_listener" "da_listener" {
  load_balancer_arn = "${aws_lb.da_lb.id}"
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.da_target.id}"
    type = "forward"
  }
}

resource "aws_route53_record" "da_entry" {
  zone_id = "${aws_route53_zone.da_zone.zone_id}"
  name = "${var.DOMAIN}."
  type = "A"

  alias {
    name = "${aws_lb.da_lb.dns_name}"
    zone_id = "${aws_lb.da_lb.zone_id}"
    evaluate_target_health = true
  }
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
    "image": "${aws_ecr_repository.da_repository.repository_url}:master",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "us-east-1",
        "awslogs-group": "${var.NAME}",
        "awslogs-stream-prefix": "main"
      }
    },
    "environment": [
      {
        "name": "EC2",
        "value": "true"
      },
      {
        "name": "S3ENABLE",
        "value": "true"
      },
      {
        "name": "S3BUCKET",
        "value": "${var.NAME}"
      },
      {
        "name": "S3ACCESSKEY",
        "value": "${var.S3_ID}"
      },
      {
        "name": "S3SECRETACCESSKEY",
        "value": "${var.S3_SECRET}"
      },
      {
        "name": "S3REGION",
        "value": "${var.S3_REGION}"
      }
    ]
  }
]
DEFINITION

  cpu = 2048
  execution_role_arn = "${aws_iam_role.da_iam.arn}"
  family = "${var.NAME}"
  memory = 4096
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
    subnets = ["${aws_subnet.da_subnet_private.*.id}"]
    security_groups = ["${aws_security_group.da_security_private.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.da_target.id}"
    container_name   = "${var.NAME}"
    container_port   = "80"
  }
}
