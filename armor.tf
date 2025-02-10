resource "google_compute_security_policy" "main" {
  name = "my-security-policy"

  dynamic "rule" {
    for_each = var.rules_src_ip_ranges
    iterator = allow
    content {
      action   = allow.value.action
      priority = allow.value.priority
      match {
        versioned_expr = "SRC_IPS_V1"
        config {
          src_ip_ranges = allow.value.ranges
        }
      }
      description = allow.value.description
    }
  }

  dynamic "rule" {
    for_each = var.rules_expression
    iterator = deny
    content {
      action   = deny.value.action
      priority = deny.value.priority
      match {
        expr {
          expression = deny.value.expression
        }
      }
      description = deny.value.description
    }
  }
}