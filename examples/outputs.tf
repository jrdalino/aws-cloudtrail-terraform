# CloudTrail
output "id" {
  value       = module.cloudtrail.id
  description = "The name of the trail."
}

output "home_region" {
  value       = module.cloudtrail.home_region
  description = "The region in which the trail was created."
}

output "arn" {
  value       = module.cloudtrail.arn
  description = "The Amazon Resource Name of the trail."
}