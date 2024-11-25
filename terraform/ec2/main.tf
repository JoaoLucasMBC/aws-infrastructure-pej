# EC2 Instance for pej-db
resource "aws_instance" "pej_db" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.pej_db.id]
  key_name      = var.key_name
  user_data     = file("${path.module}/user_data/db.sh")

  tags = {
    Name = "pej-db"
  }
}

module "vpc" {
  source = "../vpc"
}

# Security Group for pej-db
resource "aws_security_group" "pej_db" {
  name        = "pej-db"
  description = "Security group for the pej-db instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow MySQL access from application subnet"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.app_subnet_cidr]
  }

  ingress {
    description = "Custom TCP rule for port 10050"
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = [var.app_subnet_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pej-db-security-group"
  }
}