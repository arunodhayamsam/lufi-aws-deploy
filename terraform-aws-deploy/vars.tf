variable "aws_region" {
    default = "aws_region"
}
variable "vpc_cidr" {
    default = "198.168.0.0/16"
}
variable "public_subnet_cidr" {
    default = "198.168.1.0/24"
}
variable "public_subnet1_cidr" {
    default = "198.168.2.0/24"
}

variable "user" {
    default = "user_of_instance" 
}

variable "public_key" {
    default = "$PWD_publickey"
}
variable "private_key" {
    default = "$PWD_privatekey"
}
variable "aws_access_key" {
    default = "aws_access_key"
}

variable "aws_secret_key" {
    default = "aws_secrete_key"
}


