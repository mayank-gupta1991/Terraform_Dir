resource "aws_instance" "name" {
  ami= "ami-020cba7c55df1f615" # Example AMI, replace with a valid one
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "name" {
    bucket = "myuniquebucketformysonnihalandnehamayank5" # Replace with a unique bucket name
}