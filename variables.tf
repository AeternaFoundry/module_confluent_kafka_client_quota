variable "kafka_client_quota" {
  description = <<EOT
Map of kafka_client_quota, attributes below
Required:
    - display_name
    - principals
    - environment (block):
        - id (required)
    - kafka_cluster (block):
        - id (required)
    - throughput (block):
        - egress_byte_rate (required)
        - ingress_byte_rate (required)
Optional:
    - description
EOT

  type = map(object({
    display_name = string
    principals   = set(string)
    description  = optional(string)
    environment = object({
      id = string
    })
    kafka_cluster = object({
      id = string
    })
    throughput = object({
      egress_byte_rate  = string
      ingress_byte_rate = string
    })
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

