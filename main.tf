resource "ovh_domain_ds_records" "domain_ds_records" {
  for_each = var.domain_ds_records

  domain = each.value.domain

  dynamic "ds_records" {
    for_each = each.value.ds_records
    content {
      algorithm  = ds_records.value.algorithm
      flags      = ds_records.value.flags
      public_key = ds_records.value.public_key
      tag        = ds_records.value.tag
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create  = timeouts.value.create
      default = timeouts.value.default
      delete  = timeouts.value.delete
      read    = timeouts.value.read
      update  = timeouts.value.update
    }
  }
}

