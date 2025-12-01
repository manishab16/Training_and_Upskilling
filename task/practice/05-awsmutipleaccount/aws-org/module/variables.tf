variable "accounts" {
  type = map(object({
    email             = string
    ou                = string
    access_to_billing = string
  }))
}

