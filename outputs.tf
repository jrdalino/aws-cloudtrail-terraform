# CloudTrail
output "id" {
  value       = aws_cloudtrail.this.id
  description = "The name of the trail."
}

output "home_region" {
  value       = aws_cloudtrail.this.home_region
  description = "The region in which the trail was created."
}

output "arn" {
  value       = aws_cloudtrail.this.arn
  description = "The Amazon Resource Name of the trail."
}