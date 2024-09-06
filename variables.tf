variable "access" {

  default = "access key"
}
variable "secret" {
    default = "secrete keey"
  
}

variable "vpc_cidr" {
    default = "10.10.0.0/16"
  
}
variable "subnet_cidr" {
    type = list(string)
    default = [ "10.10.1.0/24","10.10.2.0/24" ]
  
}
variable "availability_zones" {
    type = list(string)
    default = [ "ap-south-1a","ap-south-1b" ]
  
}
