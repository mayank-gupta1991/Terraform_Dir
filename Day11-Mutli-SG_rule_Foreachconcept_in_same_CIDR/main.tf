resource "aws_security_group" "name" {
  ingress = [
    for port in ["22", "443", "80", "3345"] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      cidr_blocks      = ["0.0.0.0/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
    egress = [
        {
        description      = "outbound rules"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        ipv6_cidr_blocks = []
        cidr_blocks      = ["0.0.0.0/0"]
}]
}

