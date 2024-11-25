output "pej_db_instance_id" {
  value = aws_instance.pej_db.id
  description = "ID of the pej-db EC2 instance"
}

output "pej_db_private_ip" {
  value = aws_instance.pej_db.private_ip
  description = "Private IP of the pej-db EC2 instance"
}

output "pej_db_security_group_id" {
  value = aws_security_group.pej_db.id
  description = "ID of the pej-db security group"
}