# Output variables

output "public_ip_addr" {
  value = module.web.public_ip
}

output "private_ip_addr" {
  value = module.web.private_ip
}

output "id" {
  value = module.web.id
}

output "arn" {
  value = module.web.arn
}

output "key_name" {
  value = module.web.key_name
}

output "subnet_id" {
  value = data.aws_subnet.aws_subnet_selected.id
}