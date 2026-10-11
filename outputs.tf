output "domain_ds_records_id" {
  description = "Map of id values across all domain_ds_records, keyed the same as var.domain_ds_records except keys with no id are omitted"
  value       = { for k, v in ovh_domain_ds_records.domain_ds_records : k => v.id if v.id != null && length(v.id) > 0 }
}
output "domain_ds_records_domain" {
  description = "Map of domain values across all domain_ds_records, keyed the same as var.domain_ds_records except keys with no domain are omitted"
  value       = { for k, v in ovh_domain_ds_records.domain_ds_records : k => v.domain if v.domain != null && length(v.domain) > 0 }
}
output "domain_ds_records_ds_records" {
  description = "Map of ds_records values across all domain_ds_records, keyed the same as var.domain_ds_records except keys with no ds_records are omitted"
  value       = { for k, v in ovh_domain_ds_records.domain_ds_records : k => v.ds_records if v.ds_records != null && length(v.ds_records) > 0 }
}

