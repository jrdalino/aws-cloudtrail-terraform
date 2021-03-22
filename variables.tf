# General
variable "aws_region" {
  type        = string
  description = "Used AWS Region."
}

variable "aws_account" {
  type        = string
  description = "Used AWS Account."
}

variable "aws_role" {
  type        = string
  description = "Used AWS Role."
}

# Tagging
variable "namespace" {
  type        = string
  description = "Namespace."
}

variable "bounded_context" {
  type        = string
  description = "Bounded Context."
}

variable "environment" {
  type        = string
  description = "Environment."
}

# Cloudtrail
variable "aws_cloudtrail_name" {
  type        = string
  description = "(Required) Specifies the name of the trail."
}

variable "aws_cloudtrail_s3_bucket_name" {
  type        = string
  default     = "MUTABLE"
  description = "(Required) Specifies the name of the S3 bucket designated for publishing log files."
}