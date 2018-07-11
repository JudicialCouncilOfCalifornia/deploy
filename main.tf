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
