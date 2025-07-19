resource "aws_instance" "name" {
  ami="ami-05ffe3c48a9991133" # Replace with your desired AMI ID
    instance_type = "t2.micro" # Replace with your desired instance type    
    user_data = file(test.sh)
}