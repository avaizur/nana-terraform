provider "aws" {}


variable "cider_blocks" {
 description = "cider blocks and name  tags  for vpc and subnets "
 type = list(object({
   cider_block = string
   name = string
 }))
}


resource "aws_vpc" "development-vpc" {
 cidr_block = var.cider_blocks[0].cider_block
 tags = {
   Name: var.cider_blocks[0].name
 }
}


resource "aws_subnet" "dev-subnet-1" {
 vpc_id            = aws_vpc.development-vpc.id
 cidr_block        = var.cider_blocks[1].cider_block
 availability_zone = "eu-west-2a"
 tags = {
   Name: var.cider_blocks[1].name
 }
}







