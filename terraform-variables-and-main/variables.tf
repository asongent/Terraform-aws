variable "sudo_password" {
type = string
default = "password"
description = "This password is going to be unique for any resources that will be created in my accout"
}

variable "user_name" {
   type = string
   default = "admin"
   description = "This username is going to be unique accross all my aws resources"
}
 
variable "AZ_name" {
  type    = string
  default = "us-east-1a"
}

variable "image_id" {
  type = string
  default = "ami-04bf6dcdc9ab498ca"
  description = "This is for ami"
}

variable "type" {
    type = string
    default = "t2.micro"
    description = "This is for instance_type"
}

variable "name_tags" {
   type = string
   default = "TracyInstance"
   description = "This is ec2_instance name"
}


variable "vpc_id" {
    type = string
    default = "192.168.1.0/24"
    description = "This is for vpc testing. You can only try when you know Terraform"
}

variable "name" {
    type = string
    default = "honor-tracy"
 description = "This name is for vpc name"
} 
variable "s3name" {
   type = string
   default = "honor-tracy-bucket"
description = "This bucket name"
}

variable "security_group" {
   type = string
   default = "honor-tracy-security-group"
}

variable "storage_allo" {
  type = string 
  default = "20"
  description = "This storage allocation for DB(mysql) instance"
}
  variable "storage_type" {
    type = string 
    default = "gp2"
}

variable "engine"{
  type = string
  default = "mysql"
}

variable "version_type" {
type = string
default = "5.7"
}

variable "class" {
  type = string
  default = "db.m5.large"
  description = "mysql db instance class"
}

output "public_ip" {
    value = aws_instance.tracy.*.public_ip
}

output "private_ip" {
    value = aws_instance.tracy.*.private_ip
}

