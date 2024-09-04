terraform {
  required_providers  {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"

  access_key = "XAKIAZLMPLUTNER6JVRWH"
  secret_key = "XN9t7x0Fw7UCBrB9bCqf5lcDHzWT9PIR65lXeo+0J"
}



