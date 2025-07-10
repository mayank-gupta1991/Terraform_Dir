


resource "aws_instance" "instance2" {
  ami=var.ami_id
  # ami = "ami-05ffe3c48a9991133" # This is the default AMI ID for us-east-1 
  instance_type = "t2.nano"

  key_name = var.key_name
  # key_name = "test1" # This is the default key pair name
 tags = {
  Name = "Day3-Terraform2" 
}
}
resource "aws_instance" "instance1" {
  ami=var.ami_id
  # ami = "ami-05ffe3c48a9991133" # This is the default AMI ID for us-east-1 
  instance_type = var.instance_type
  # instance_type = "t2.micro" # This is the default instance type
  key_name = var.key_name
  # key_name = "test1" # This is the default key pair name
 tags = {

  Name = "Day3-Terraform1-Default-instance" 
}
}

