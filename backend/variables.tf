variable "bucket_name" {
  default = "S3_Bucket_Terraform"
  type    = string
}

variable "sse_algorithm" {
  default     = "AES256"
  type        = string
  description = "Algorithm for SSE"
}

variable "db_name_backend_s3" {
  description = "Dynamo DB Name"
  type        = string
}
