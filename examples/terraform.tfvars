# General
aws_region  = "ap-southeast-1"
aws_account = "623552185285" # AWS account where resource will be created
aws_role    = "OrganizationAccountAccessRole"

# Tagging
namespace       = "bbsdm"
bounded_context = "organisation"
environment     = "production"

# Cloudtrail
aws_cloudtrail_name           = "default"
aws_cloudtrail_s3_bucket_name = "623552185285-ap-southeast-1-cloudtrail"