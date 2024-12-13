terraform {
  backend "s3" {
    bucket         = "terraform-s3-bucket-visionet"        # Replace with your S3 bucket name
    key            = "sop/terraform.tfstate"  # Path in the bucket where the state file will be stored
    region         = "eu-north-1"                  # AWS region where the S3 bucket and DynamoDB table are located
    encrypt        = true                         # Enable encryption of the state file in S3 (recommended)
    dynamodb_table = "terraform-state-table"   # Replace with your DynamoDB table name used for state locking
  }
  required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.7"
        }
    }
    required_version = "~> 1.10"
}
