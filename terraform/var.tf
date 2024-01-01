variable "Bastion_logGroup" {
  type    = string
  default = "Bastion_logGroup"

}

variable "App_logGroup" {
  type    = string
  default = "App_logGroup"

}

variable "create_log_group" {
  type =  bool
  default = false
}