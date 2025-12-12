provider "aws" {
    region = "eu-west-1"
  
}

# EC2 instance
resource "aws_instance" "db_node_instance" {
    # which AMI ID ami-0c1c30571d2dae5c9 (for ubuntu 22.04 lts)
    ami                          = "ami-0c1c30571d2dae5c9"
    instance_type                = "t3.micro"
    associate_public_ip_address  = false
    vpc_security_group_ids = [aws_security_group.db_node_sg.id]

    tags = {
        Name = "tech515-oliver-ubuntu-2204-ansible-target-node-db"
    }

    key_name = "tech515-oliver-aws"
}

#security groups
resource "aws_security_group" "db_node_sg" {
    name = "tech515-oliver-27017 -tf-allow-ssh-mongo"
    description = "allow mongodb"

    ingress {
        description = "27017 mongodb"
        from_port   = 27017
        to_port     = 27017
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
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