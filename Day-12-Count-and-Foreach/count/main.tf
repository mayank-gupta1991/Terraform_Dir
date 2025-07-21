resource "aws_instance" "name" {
  count         = length(var.env)
  ami           = "ami-085ad6ae776d8f09c"
  instance_type = (
    var.env[count.index] == "dev" ? "t2.micro" :  var.env[count.index] == "test" ? "t2.small" : "t2.medium"
  )
  tags = {
    Name = "instance-${var.env[count.index]}"
  }
}
variable "env" {
  type    = list(string)
  default = [ "dev", "prod"]
}