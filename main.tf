terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = "mybucket-${random_id.rand_id.hex}"
}

resource "aws_s3_bucket_public_access_block" "static_website_bucket_public_access_block" {
  bucket = aws_s3_bucket.static_website_bucket.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
} 

resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.static_website_bucket.bucket}/*"
      },
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.static_website_bucket.bucket}/styles.css"  # Explicitly allow access to the CSS file
      },
    ]
  })
}
resource "aws_s3_bucket_website_configuration" "s3bucket_website" {
  bucket = aws_s3_bucket.static_website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.static_website_bucket.bucket
  key    = "index.html"
  source = "./index.html"
  content_type = "text/html"
}


resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.static_website_bucket.bucket
  key    = "styles.css"  # This must match the href in index.html
  source = "./styles.css"
  content_type = "text/css"
}

output "name" {
  value = aws_s3_bucket_website_configuration.s3bucket_website.website_endpoint
}