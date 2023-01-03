terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    # 이전에 생성한 버킷 이름으로 변경
    bucket = "aws11-terraform-state"
    key    = "prod/data-stores/mysql/terraform.tfstate"
    region = "ap-northeast-2"

    # 이전에 생성한 다이나모DB 테이블 이름으로 변경
    dynamodb_table = "aws11-prod-terraform-locks"
    encrypt        = true
  }
}
provider "aws" {
  region = "ap-northeast-2"
}
resource "aws_db_instance" "example" {
  identifier_prefix = "aws11-prod-terraform-example"
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  skip_final_snapshot = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
}

