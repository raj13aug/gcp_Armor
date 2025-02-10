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

variable "action" {
  type    = string
  default = "deny"
}

variable "preview_mode" {
  type    = string
  default = false
}

variable "owasp_rules" {
  type = map(object({
    priority    = string
    expression  = string
    description = string
  }))
}