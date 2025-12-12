provider "aws" {
  region = "eu-west-1"

}
# EC2 instance
resource "aws_instance" "controller_instance" {
  # which AMI ID ami-0c1c30571d2dae5c9 (for ubuntu 22.04 lts)
  ami                         = "ami-0c1c30571d2dae5c9"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.controller_sg.id]

  tags = {
    Name = "tech515-oliver-ubuntu-2204-ansible-controller"
  }

  key_name = "tech515-oliver-aws"
}

#security groups
resource "aws_security_group" "controller_sg" {
  name        = "tech515-oliver-tf-allow-ssh-http"
  description = "allow traffic from port 22 and 80"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_key_pair" "existing_key" {
  key_name = "tech515-oliver-aws"
}
