variable "public_key_path" {
    description = "Path to the public key file"
    type = string
    default = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Key pair name to use"
  type = string
}