variable "aws_region"
{
  description = "AWS Region for VPC"
  default = "ap-south-1"
}

variable "vpc_cidr"
{
  description = "VPC CIDR Range"
  default = "10.20.0.0/16"
}

variable "private_subnet_cidr"
{
  description = "Private Subnet CIDR"
  default = "10.20.10.0/24"
}

variable "public_subnet_cidr"
{
  description = "Public Subnet CIDR"
  default = "10.20.20.0/24"
}

variable "ssh_key"
{
  description = "SSH key for wordpress instance"
  default = "/home/ubuntu/.ssh/id_rsa.pub"
}
