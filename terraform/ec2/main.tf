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

# EC2 Instance for pej-infra
resource "aws_instance" "pej_infra" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.pej_infra.id]
  key_name      = var.infra_key_name
  user_data     = file("${path.module}/user_data/infra.sh") # User data for pej-infra

  root_block_device {
    volume_size = 30       # 30GB storage
    volume_type = "gp2"    # General purpose SSD
  }

  tags = {
    Name = "pej-infra"
  }
}

# Security Group for pej-infra
resource "aws_security_group" "pej_infra" {
  name        = "pej-infra"
  description = "Security group for the pej-infra instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Change to zabbix ip 
  ingress {
    description = "Allow TCP on port 10050"
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Change to vpn ip 
  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pej-infra-security-group"
  }
}

# EC2 Instance for pej-jump
resource "aws_instance" "pej_jump" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.pej_jump.id]
  key_name      = var.jump_key_name
  user_data     = file("${path.module}/user_data/jump.sh") # User data for pej-jump

  root_block_device {
    volume_size = 8        # 8GB storage
    volume_type = "gp2"    # General Purpose SSD
  }

  tags = {
    Name = "pej-jump"
  }
}

# Security Group for pej-jump
resource "aws_security_group" "pej_jump" {
  name        = "pej-jump"
  description = "Security group for the pej-jump instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow UDP traffic on port 13354"
    from_port   = 13354
    to_port     = 13354
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow TCP traffic on port 10050"
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pej-jump-security-group"
  }
}
