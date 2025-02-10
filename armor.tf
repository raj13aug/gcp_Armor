resource "google_compute_security_policy" "policy" {
  name = "owasp-security-policy"
  rule {
    action   = "allow"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }
  dynamic "rule" {
    for_each = var.owasp_rules
    content {
      preview     = var.preview_mode
      action      = var.action
      priority    = rule.value.priority
      description = rule.value.description
      match {
        expr {
          expression = rule.value.expression
        }
      }
    }
  }
}