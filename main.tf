resource "confluent_kafka_client_quota" "kafka_client_quota" {
  for_each = var.kafka_client_quota

  display_name = each.value.display_name
  principals   = each.value.principals
  description  = each.value.description

  environment {
    id = each.value.environment.id
  }

  kafka_cluster {
    id = each.value.kafka_cluster.id
  }

  throughput {
    egress_byte_rate  = each.value.throughput.egress_byte_rate
    ingress_byte_rate = each.value.throughput.ingress_byte_rate
  }
}

