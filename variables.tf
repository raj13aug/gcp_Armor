variable "gcp_project_id" {
  type        = string
  description = "ID of the project in scope"
  default     = "vm-group-448915"
}

variable "region" {
  type        = string
  description = "default region"
  default     = "us-central1"
}
variable "security_policy_name" {
  description = "The name for the security policy"
  type        = string
  default     = "my-security-policy"
}

variable "rules_src_ip_ranges" {
  description = "A list of security rules src ip ranges to be applied"
  type = list(object({
    action      = string
    priority    = number
    ranges      = list(string)
    description = string
  }))
}

variable "rules_expression" {
  description = "A list of security rules expression to be applied"
  type = list(object({
    action      = string
    priority    = number
    expression  = string
    description = string
  }))
}