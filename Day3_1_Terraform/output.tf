output "names" {
  value = [
    aws_instance.instance1.tags["Name"],
    aws_instance.instance2.tags["Name"],
  
  ]
  
}
output "ip_addresses" {
  value = [
    aws_instance.instance1.public_ip,
    aws_instance.instance2.public_ip,
  
  ]
  
}
output "subnet_ids" {
  value = [
    aws_instance.instance1.subnet_id,
    aws_instance.instance2.subnet_id,
    
  ]
  
}