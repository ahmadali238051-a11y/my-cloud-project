output "my_instance_ip" {
  value = aws_instance.my_project_web_server.public_ip
}

output "vpc_id" {
  value = aws_vpc.my_project_vpc.id
}