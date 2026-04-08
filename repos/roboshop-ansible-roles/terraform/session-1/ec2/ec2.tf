resource "aws_instance" "linux" {
  ami           = "ami-0ab515046786de9dc"
  instance_type = "t4g.micro"
  vpc_security_group_ids = [aws_security_group.roboshop-all.id]

  tags = {
    Name = "Helloterraform"
  }
}

resource "aws_security_group" "roboshop-all" { #this is terraform name, terraform reference only
  name        = "roboshop-all-aws" # this is for aws
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-057582f806eba01e2"

  ingress {
    description = "allow all ports"
    from_port   = 0 # 0 means allow-all
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-allow-all"
  }
}