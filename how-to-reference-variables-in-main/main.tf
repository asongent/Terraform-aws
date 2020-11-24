
resource "aws_instance" "tracy"{
    ami = var.image_id
    instance_type = var.type
    tags = {
        Name = var.name_tags
        Env = "dev"
  }
}
resource "aws_vpc" "tracyvpc" {
    cidr_block = var.vpc_id
    tags = {
        Name = var.name
    }
}
resource "aws_s3_bucket" "hono-tracy-bucket" {
    bucket = var.s3name
    acl = "private"
   lifecycle {
        prevent_destroy = false
    }
 versioning {
        enabled = false
        mfa_delete = false
     }
     server_side_encryption_configuration {
         rule {
             apply_server_side_encryption_by_default {
                 sse_algorithm = "AES256"
             }
         }
     }
    }

resource "aws_db_instance" "mydb" {
  allocated_storage    = var.storage_allo
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.version_type
  instance_class       = var.class
  name                 = "mydb"
  username             = var.user_name
  password             = var.sudo_password
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = "true"
  final_snapshot_identifier = false
}

resource "aws_redshift_cluster" "tracy" {
  cluster_identifier = "honor"
  database_name      = "myredshiftdb"
  master_username    = "admin"
  master_password    = "Password1"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  publicly_accessible = "true"
  final_snapshot_identifier = false
}
resource "aws_dynamodb_table" "dynamo" {
  hash_key       = "LockID"
  name           = "dynamo"
  billing_mode = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"
  read_capacity  = 10
  write_capacity = 10

   attribute {
    name = "LockID"
    type = "S"
  }
}

