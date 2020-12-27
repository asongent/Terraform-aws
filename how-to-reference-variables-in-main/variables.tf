#General Information: Variables consist of username and password are going to be 
#used on resources that are username and password dependent.
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

variable "user_name" {
   type = string
   default = "admin"
   description = "This username is going to be unique accross all my aws resources"
}

variable "sudo_password" {
type = string
default = "password"
description = "This password is going to be unique for any resources that will be created in my accout"
}
 

#This is the available zone(AZ) where all my aws resources are going to be deployed.
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

variable "AZ_name" {
  type    = string
  default = "us-east-1a"
}

#This variables are to be referenced on the respected feature  of EC2 Instance on main.tf
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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


#VPC where all the resources will be hosted. In this vpc, there will be
#a surity group that will defind ingress and engress rules.
#The VPC and security will as well have name.
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

variable "vpc_id" {
    type = string
    default = "192.168.1.0/24"
    description = "This is for vpc testing. You can only try when you know Terraform"
}

variable "security_group" {
   type = string
   default = "honor-tracy-security-group"
}

variable "name" {
    type = string
    default = "honor-tracy"
 description = "This name is for vpc name" 
   }


#These variables will be referenced on semple storage service (s3) on maint.tf.
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

variable "s3name" {
   type = string
   default = "honor-tracy-bucket"
description = "This bucket name"
}

#These variables will be referenced on DB n main.tf.
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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

#These can be incluted in the main.tf. It will print out output or features of any 
#resources that you want to see. On the output below, 
#I want to see the public and private ip addresses of my ec2 instance. 
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
output "public_ip" {
    value = aws_instance.tracy.*.public_ip
}

output "private_ip" {
    value = aws_instance.tracy.*.private_ip
}

