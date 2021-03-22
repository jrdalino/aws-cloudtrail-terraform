data "aws_caller_identity" "current" {}

# Cloudtrail
resource "aws_cloudtrail" "this" {
  name           = var.aws_cloudtrail_name
  s3_bucket_name = aws_s3_bucket.this.id
  s3_key_prefix  = "prefix"
  # cloud_watch_logs_role_arn
  # cloud_watch_logs_group_arn 
  enable_logging                = true
  include_global_service_events = true
  is_multi_region_trail         = true
  is_organization_trail         = true
  # sns_topic_name
  # enable_log_file_validation
  # kms_key_id

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    # Logging All Lambda Function Invocations
    data_resource {
      type   = "AWS::Lambda::Function"
      values = ["arn:aws:lambda"]
    }

    # Logging All S3 Bucket Object Events
    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::"]
    }
  }

  # Tagging
  tags = {
    Name           = var.aws_cloudtrail_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket        = var.aws_cloudtrail_s3_bucket_name
  force_destroy = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::623552185285-ap-southeast-1-cloudtrail"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": [
                "arn:aws:s3:::623552185285-ap-southeast-1-cloudtrail/prefix/AWSLogs/623552185285/*"
            ],
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY

  # Tagging
  tags = {
    Name           = var.aws_cloudtrail_s3_bucket_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }

}