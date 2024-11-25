output "vpc_id" {
  value = aws_vpc.pej.id
  description = "ID of the VPC"
}

output "public_subnet_id" {
  value = aws_subnet.public.id
  description = "ID of the public subnet"
}

output "private_subnet_id" {
  value = aws_subnet.private.id
  description = "ID of the private subnet"
}

output "internet_gateway_id" {
  value = aws_internet_gateway.pej.id
  description = "ID of the internet gateway"
}

output private_subnet_ip {
  value = aws_subnet.private.cidr_block
  description = "IP of the private subnet"
}

output public_subnet_ip {
  value = aws_subnet.public.cidr_block
  description = "IP of the public subnet"
}