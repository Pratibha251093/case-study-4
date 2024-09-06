variable "access" {

  default = "AKIAWOOXUACHC62PWIY3"
}
variable "secret" {
    default = "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"
  
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