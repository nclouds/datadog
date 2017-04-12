variable "datadog_api_key" {}
variable "datadog_app_key" {}
variable "enviroment_tag" {}
variable "users" {
  type    = "string"
  default = "@shan@nclouds.com"
}
variable "warning"{
  type = "map"
  default = {
    "CPU" = "99"
    "MEMORY" = "8"
    "SWAP" = "8"
    "DISK" = "15"
    "LOAD" = "3"
    "NTP" = "3"
  }
}
variable "critical"{
  type = "map"
  default = {
    "CPU" = "100"
    "MEMORY" = "5"
    "SWAP" = "5"
    "DISK" = "10"
    "LOAD" = "4"
    "NTP" = "5"
  }
}
