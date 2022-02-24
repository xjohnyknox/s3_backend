variable "bucket_name" {
  default = "S3_Bucket_Terraform"
  type    = string
}
variable "sse_algorithm" {
  default     = "AES256"
  type        = string
  description = "Algorithm for SSE"
}

variable "dynamodb_name" {
  description = "Dynamo DB Name"
  type        = string
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "Default zone to deploy"

}
variable "profile" {
  default     = "openmind"
  type        = string
  description = "AWS profile to deploy"
}
