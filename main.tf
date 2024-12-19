# AWS Provider configuration
provider aws {
    region = "eu-north-1"
}

# S3 bucket creation
resource "aws_s3_bucket" "test" {
  bucket = "visionet-sop-dhanabalan"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

# IAM role creation
resource "aws_iam_role" "s3_full_access_role" {
  name               = "S3FullAccessRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          AWS = "arn:aws:iam::345594591593:user/dhanabalan"
        }
        Effect    = "Allow"
        Sid       = ""
      },
         {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_policy" "s3_full_access_policy" {
  name        = "S3FullAccessPolicy"
  description = "Full access to all S3 actions"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:*"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_full_access_attachment" {
  role       = aws_iam_role.s3_full_access_role.name
  policy_arn = aws_iam_policy.s3_full_access_policy.arn
}

output "role_arn" {
  value = aws_iam_role.s3_full_access_role.arn
}
