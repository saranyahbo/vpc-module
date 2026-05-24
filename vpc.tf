############
# vpc creation
############

resource "aws_vpc" "eks_vpc" {
    cidr_block =  var.vpc_cidr
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
    enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
    tags = {
        "name"="eks-vpc"
    }
}

############
# public subnets creation
############

resource "aws_subnet" "routable_subnet-1" {
    availability_zone = data.aws_availability_zones.available_zones.names[0]
    cidr_block = var.routable_subnet-1
    vpc_id = aws_vpc.eks_vpc.id
    tags={
        "name"= "routable_subnet-1"
    }
}

resource "aws_subnet" "routable_subnet-2" {
    availability_zone = data.aws_availability_zones.available_zones.names[1]
    cidr_block = var.routable_subnet-2
    vpc_id = aws_vpc.eks_vpc.id
    tags={
        "name"= "routable_subnet-2"
    }
}

resource "aws_subnet" "routable_subnet-3" {
    availability_zone = data.aws_availability_zones.available_zones.names[2]
    cidr_block = var.routable_subnet-3
    vpc_id = aws_vpc.eks_vpc.id
    tags={
        "name"= "routable_subnet-3"
    }
}

############
# private subnets creation
############

resource "aws_subnet" "non-routable_subnet-1" {
    availability_zone = data.aws_availability_zones.available_zones.names[3]
    cidr_block = var.non-routable_subnet-1
    vpc_id = aws_vpc.eks_vpc.id
    tags={
        "name"= "non-routable_subnet-1"
    }
}

resource "aws_subnet" "non-routable_subnet-2" {
    availability_zone = data.aws_availability_zones.available_zones.names[4]
    cidr_block = var.non-routable_subnet-2
    vpc_id = aws_vpc.eks_vpc.id
    tags={
        "name"= "non-routable_subnet-2"
    }
}

resource "aws_subnet" "non-routable_subnet-3" {
    availability_zone = data.aws_availability_zones.available_zones.names[5]
    cidr_block = var.non-routable_subnet-3
    vpc_id = aws_vpc.eks_vpc.id
    tags={
        "name"= "non-routable_subnet-3"
    }
}

##############
# internet gateway for vpc
#############

resource "aws_internet_gateway" "igw1" {
    vpc_id = aws_vpc.eks_vpc.id
    tags = {
        "name"= "internet-gateway"
    }
}

############################
# route table for inetrnet gateway 
############################

resource "aws_route_table" "route_table_igw" {
    vpc_id = aws_vpc.eks_vpc.id
    route = {
        cidr_block = var.igw_routable_cidr_id
        gateway_id = aws_internet_gateway.igw1.id
    }
}

###################
# the public subnets are associated with the internet gateway route table
###################

resource "aws_route_table_association" "igw-routable_subnet-1" {
  subnet_id = aws_subnet.routable_subnet-1.id
  route_table_id = aws_route_table.route_table_igw
}

resource "aws_route_table_association" "igw-routable_subnet-2" {
  subnet_id = aws_subnet.routable_subnet-2.id
  route_table_id = aws_route_table.route_table_igw
}

resource "aws_route_table_association" "igw-routable_subnet-3" {
  subnet_id = aws_subnet.routable_subnet-3.id
  route_table_id = aws_route_table.route_table_igw
}

## elastic ip for nat gateway

resource "aws_eip" "elastic_ip" {
    domain = "vpc"
}

## nat gateway creation, nat gateway will be created in public subnet

resource "aws_nat_gateway" "nat_gateway" {
    subnet_id = aws_subnet.routable_subnet-1.id
    allocation_id = aws_eip.elastic_ip.id
    tags = {
        "name" = "nat-gateway"
    }
}

## rouate table for private subnets

resource "aws_route_table" "non-routable-subnet-route-1" {
    vpc_id = aws_vpc.eks_vpc.id
    route = {
        cidr_block = var.non-routable_cidr-route
        nat_gateway = aws_nat_gateway.nat_gateway.id
    }
    tags ={
        "name" = "non-routable-subnet-1"
    }
}

resource "aws_route_table" "non-routable-subnet-route-2" {
    vpc_id = aws_vpc.eks_vpc.id
    route = {
        cidr_block = var.non-routable_cidr-route
        nat_gateway = aws_nat_gateway.nat_gateway.id
    }
    tags ={
        "name" = "non-routable-subnet-2"
    }
}

resource "aws_route_table" "non-routable-subnet-route-3" {
    vpc_id = aws_vpc.eks_vpc.id
    route = {
        cidr_block = var.non-routable_cidr-route
        nat_gateway = aws_nat_gateway.nat_gateway.id
    }
    tags ={
        "name" = "non-routable-subnet-3"
    }
}

## route table association for private subnets

resource "aws_route_table_association" "non-routable-subnet-route-1-association" {
    route_table_id = aws_route_table.non-routable-subnet-route-1.id
    subnet_id = aws_subnet.non-routable_subnet-1.id
}

resource "aws_route_table_association" "non-routable-subnet-route-2-association" {
    route_table_id = aws_route_table.non-routable-subnet-route-2.id
    subnet_id = aws_subnet.non-routable_subnet-2.id
}

resource "aws_route_table_association" "non-routable-subnet-route-3-association" {
    route_table_id = aws_route_table.non-routable-subnet-route-3.id
    subnet_id = aws_subnet.non-routable_subnet-3.id
}