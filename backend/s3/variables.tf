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
