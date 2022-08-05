resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket

  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "bucket_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.website_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "bucket_policy"{
  bucket = aws_s3_bucket.website_bucket.id
  policy = data.aws_iam_policy_document.public_read.json
}

data "aws_iam_policy_document" "public_read" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    sid = "PublicReadForGetBucketObjects"
    actions = [
      "s3:GetObject"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket}/*",
    ]
  }
}