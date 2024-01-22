output "dns_zones" {
  value = module.dns.route53_zone
}
output "dns_records" {
  value = module.dns.route53_record
}

