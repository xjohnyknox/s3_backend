// s3 bucket
// dynamoDB table

resource "aws_s3_bucket" "s3_backend" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
  lifecycle {
    prevent_destroy = true
  }
  tags = locals.tags
}


resource "aws_dynamodb_table" "db_backend_s3" {
  name           = var.db_name_backend_s3
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
