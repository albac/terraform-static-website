variable "domain" {  
  type        = string  
  description = "Domain"
}

variable "environment" {
  type = string
  description = "Environment"
}

variable "zone_id" {
  type = string
  description = "Route53 zone id"
}

variable "region" {  
  type        = string  
  default     = "us-west-2"  
  description = "Name of the s3 bucket to be created."
}

variable "role_arn" {
  type = string
  description = "Role ARN"
}

variable "session_name" {
  type = string
  description = "Session Name"
}
