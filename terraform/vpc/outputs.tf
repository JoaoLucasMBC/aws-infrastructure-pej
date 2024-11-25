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