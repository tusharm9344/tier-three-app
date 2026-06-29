provider "aws" {
  region = var.aws_region
}

# ─── Security Group ─────────────────────────────────────────────
resource "aws_security_group" "app_sg" {
  name        = "3tier-sg"
  description = "Allow HTTP and SSH"

  ingress {
    description = "SSH from your IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # replace with your IP/32 for safety
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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

# ─── EC2 Instance ───────────────────────────────────────────────
resource "aws_instance" "app_ec2" {
  ami                    = "ami-0f58b397bc5c1f2e8" # Ubuntu 22.04 ap-south-1
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io docker-compose
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "3tier-server"
  }
}
