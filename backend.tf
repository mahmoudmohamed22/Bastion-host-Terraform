terraform {
  backend "s3" {
    bucket = "infra-backend-state"
    key    = "terraform.tfstate"
    dynamodb_table ="infra-state"
    region = "us-east-1"
  }
}
