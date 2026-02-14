terraform {
  backend "s3" {
    bucket         = "project-bedrock-tfstate-ofor-1535"
    key            = "bedrock/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "project-bedrock-locks"
    encrypt        = true
  }
}
