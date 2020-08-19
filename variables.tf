# EC2 Web input variables

variable "server_count" {
  type    = number
  default = 1
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "name" {
  type    = string
  default = "web"
}

variable "ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "sg_name" {
  type = string
}
