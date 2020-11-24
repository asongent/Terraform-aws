
variable "instance_count" {
  type = string
  default = "3"
}

variable "name" {
  type = list(string)
  default = ["First-Instance", "Second-Instance", "Third-Instance"]
}

resource "aws_instance" "web" {
  count  = (var.instance_count)
  ami    = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"

  tags = {
    Name  =  element(var.name, count.index)
    Purpose ="Terraform Test"
  }
}

variable "s3_bucket_names" {
  type = list
  default = ["terraform-irst-bucket", "terraform-second-bucket", "terraform-third-bucket"]
}

resource "aws_s3_bucket" "terraform_buckets" {
  count         = length(var.s3_bucket_names) //count will be 3
  bucket        = var.s3_bucket_names[count.index]
  acl           = "private"
}
lifecycle {
  prevent_destroy = false
}
versioning {
  enabled = false
  mfa_delete = false
}
  tags = {
    Name        = "terraform-bucket"
    Environment = "production"
  }
}