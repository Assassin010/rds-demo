terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "dbtest" {
  allocated_storage       = 10
  max_allocated_storage   = 20
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  db_name                 = "dbtest"
  username                = "gauthierdb"
  password                = "foobrdscg"
  parameter_group_name    = "default.mysql5.7"
  skip_final_snapshot     = true
  publicly_accessible     = true
  maintenance_window      = "Fri:09:00-Fri:09:30"
  backup_retention_period = 0
}

resource "aws_db_snapshot" "test0" {
  db_instance_identifier = aws_db_instance.dbtest.id
  db_snapshot_identifier = "testsnapshot1234"
}
