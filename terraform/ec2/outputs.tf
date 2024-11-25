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

output "pej_infra_instance_id" {
  value = aws_instance.pej_infra.id
  description = "ID of the pej-infra EC2 instance"
}

output "pej_infra_public_ip" {
  value = aws_instance.pej_infra.public_ip
  description = "Public IP of the pej-infra EC2 instance"
}

output "pej_infra_security_group_id" {
  value = aws_security_group.pej_infra.id
  description = "ID of the pej-infra security group"
}

output "pej_jump_instance_id" {
  value = aws_instance.pej_jump.id
  description = "ID of the pej-jump EC2 instance"
}

output "pej_jump_public_ip" {
  value = aws_instance.pej_jump.public_ip
  description = "Public IP of the pej-jump EC2 instance"
}

output "pej_jump_security_group_id" {
  value = aws_security_group.pej_jump.id
  description = "ID of the pej-jump security group"
}

output "pej_zabbix_instance_id" {
  value = aws_instance.pej_zabbix.id
  description = "ID of the pej-zabbix EC2 instance"
}

output "pej_zabbix_public_ip" {
  value = aws_instance.pej_zabbix.public_ip
  description = "Public IP of the pej-zabbix EC2 instance"
}

output "pej_zabbix_security_group_id" {
  value = aws_security_group.pej_zabbix.id
  description = "ID of the pej-zabbix security group"
}

output "pej_wazuh_instance_id" {
  value = aws_instance.pej_wazuh.id
  description = "ID of the pej-wazuh EC2 instance"
}

output "pej_wazuh_public_ip" {
  value = aws_instance.pej_wazuh.public_ip
  description = "Public IP of the pej-wazuh EC2 instance"
}

output "pej_wazuh_security_group_id" {
  value = aws_security_group.pej_wazuh.id
  description = "ID of the pej-wazuh security group"
}