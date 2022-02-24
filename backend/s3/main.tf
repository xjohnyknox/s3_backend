// s3 bucket
// dynamoDB table

resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }
  tags = local.tags
}
resource "aws_s3_bucket_acl" "s3-bucket" {
  bucket = aws_s3_bucket.s3-bucket.id
  acl    = "private"
}
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_setup" {
  bucket = aws_s3_bucket.s3-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_setup" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_dynamodb_table" "dynamodb_name" {
  name           = var.dynamodb_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = local.tags
}
