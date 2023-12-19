# some example variables
variable "az" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "default_tags" {
  type = map(any)
  default = {
    managed_by : "terraform"
  }
}
