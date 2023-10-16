resource "aws_vpc" "seljenkins-vpc" {
    instance_tenancy = "default"
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        name = "test-vpc"
    }
}


resource "aws_subnet" "seljenkins-pubsub" {
    vpc_id = aws_vpc.seljenkins-vpc.id
    cidr_block = "10.0.11.0/24"
    map_public_ip_on_launch = true

    tags = {
        name = "test-pubsub"
    }
}

resource "aws_internet_gateway" "seljenkins-igw" {
    vpc_id = aws_vpc.seljenkins-vpc.id

    tags = {
        name = "test-igw"
    }
}

resource "aws_eip" "seljenkins-eip" {
    domain = "vpc"
    instance = aws_instance.seljenkins-server.id

    tags = {
        name = "test-eip"
    }

}

resource "aws_route_table" "seljenkins-prt" {
    vpc_id = aws_vpc.seljenkins-vpc.id
}

resource "aws_route" "seljenkins-pubr" {
    route_table_id = aws_route_table.seljenkins-prt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.seljenkins-igw.id

}

resource "aws_route_table_association" "seljenkins-prt-asso" {
    route_table_id = aws_route_table.seljenkins-prt.id
    subnet_id = aws_subnet.seljenkins-pubsub.id
}