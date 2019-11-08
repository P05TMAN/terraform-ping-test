variable "stack_name" {}
variable "vpc_id" {}
variable "something_ingress_cidr" {
  type = "list"
}

variable "environment" {
  default = "production"
}
