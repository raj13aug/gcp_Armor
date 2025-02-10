rules_src_ip_ranges = [{
  action      = "allow"
  priority    = 1
  ranges      = ["0.0.0.0/0"]
  description = "allow all"
  }
]

rules_expression = [{
  action      = "deny(403)"
  priority    = 2
  expression  = "request.headers['x-forwarded-for'].contains('127.0.0.1')"
  description = "deny 127.0.0.1"
  }
]