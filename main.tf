# AWS Provider configuration
provider aws {
    region = "eu-north-1"
}
resource "aws_s3_bucket" "test" {
  bucket = "visionet-sop-dhanabalan"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}