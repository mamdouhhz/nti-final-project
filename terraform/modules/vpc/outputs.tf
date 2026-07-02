output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public-subnets[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private-subnets[*].id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat-gw.id
}

output "availability_zones" {
  value = aws_subnet.public-subnets[*].availability_zone
}