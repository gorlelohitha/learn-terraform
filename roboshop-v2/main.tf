#variable "component" {
 # default = [ "frontend " ,"mongodb", "catalogue"
  #]
#}

variable "component" {
  default = {
    frontend = {
      instance_type =" t2 micro"
    }
  }
}
mongodb ={
  instance_type = "t2 micro"
}






