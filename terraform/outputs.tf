output "ec2_public_ip" {
  value       = aws_instance.app_ec2.public_ip
  description = "EC2 ka public IP"
}
