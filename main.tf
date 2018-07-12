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

resource "aws_ecr_repository" "da_repository" {
  name = "${var.NAME}"
}

resource "aws_ecs_cluster" "da_cluster" {
  name = "${var.NAME}"
}

resource "aws_ecs_task_definition" "da_task" {
  container_definitions = "${file("service.json")}"
  cpu = 512
  family = "${var.NAME}"
  memory = 1024
  requires_compatibilities = "FARGATE"
}

resource "aws_ecs_service" "da_service" {
  cluster = "${aws_ecs_cluster.da_cluster.id}"
  desired_count = 1
  launch_type = "FARGATE"
  name = "${var.NAME}"
  task_definition = "${aws_ecs_task_definition.da_task.arn}"
}
