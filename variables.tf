variable "domain_ds_records" {
  description = <<EOT
Map of domain_ds_records, attributes below
Required:
    - domain
    - ds_records (block):
        - algorithm (required)
        - flags (required)
        - public_key (required)
        - tag (required)
Optional:
    - timeouts (block):
        - create (optional)
        - default (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    domain = string
    ds_records = list(object({
      algorithm  = string
      flags      = string
      public_key = string
      tag        = number
    }))
    timeouts = optional(object({
      create  = optional(string)
      default = optional(string)
      delete  = optional(string)
      read    = optional(string)
      update  = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.domain_ds_records : (
        length(v.ds_records) >= 1 && length(v.ds_records) <= 4
      )
    ])
    error_message = "Each ds_records list must contain between 1 and 4 items"
  }
}

