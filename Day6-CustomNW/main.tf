#vpc creation
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
#Subnet Creation
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "test subnet"
  }
}
#Internet Gateway Creation
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}
#Route Table Creation 

resource "aws_route_table" "rtc" {
    vpc_id = aws_vpc.main.id
    route {
    cidr_block="0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
    }
}

#edit route table to add internet gateway
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.rtc.id
}
#Associate route table with subnet
#Security Group Creation
  #SG grooup
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
}
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #all protocols 
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}
resource "aws_instance" "name" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.main.id
    vpc_security_group_ids = [ aws_security_group.allow_tls.id]
  
}

#Nat Gateway Creationte

