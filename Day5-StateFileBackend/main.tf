
resource "aws_instance" "instance" {
  ami="ami-05ffe3c48a9991133"
  # ami = "ami-05ffe3c48a9991133" # This is the default AMI ID for us-east-1 
  instance_type = "t2.nano"

  key_name = "key"
  # key_name = "test1" # This is the default key pair name
 tags = {
  Name = "Day5-stateBackend-instance" 
}
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "mystatefiles3bucketfornihaldatatoecheck"  # Must be globally unique
  
 tags = {
    Name        = "MyS3Bucket"
  }
}