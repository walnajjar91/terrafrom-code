provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "network-vpc" {
    cidr_block = "10.0.1.0/16"
    tags = {
        Name: "network-vpc"
    }
}

resource "aws_subnet" "firewall-subnet" {
    vpc_id = aws_vpc.network-vpc.id
    cidr_block  = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name: "firewall-subnet-1"
    }
}

data "aws_vpc" "existing_vpc" {
    cidr_block =  "10.0.0.0/16"
}

resource "aws_subnet" "firewall-subnet2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block  = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name: "firewall-subnet-2"
    }
}