output "instance_id" {
  value = aws_instance.jenkins.id
}

output "jenkins_instance_arn" {
  value = aws_instance.jenkins.arn
}

output "public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "private_ip" {
  value = aws_instance.jenkins.private_ip
}

output "security_group_id" {
  value = aws_security_group.jenkins.id
}

output "iam_role_name" {
  value = aws_iam_role.jenkins.name
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.jenkins.name
}