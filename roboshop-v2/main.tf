variable "ami" {
  default = "ami-03265a0778a880afb"
}
variable "security_group" {
  default =  ["sg-0d4ae6cf839bb7a89"]

}
variable "instance_type" {
  default = "t2.micro"
}

variable "zone_id" {
  default = "Z01549722JL2MSDGK9YRB"
}

variable "component" {
  default = {
    frontend = {name= "frontend-dev"}
    mongodb = {name= "mongodb-dev"}
    catalogue = {name= "catalogue-dev"}
    user = {name= "user-dev"}
    redis = {name = "redis-dev"}
    cart = {name = "cart-dev"}
    mysql = {name = "mysql-dev"}
    shipping = {name = "shipping-dev"}
    rabbitmq = {name = "rabbitmq-dev"}
    payment = {name = "payment-dev"}
  }
}





resource "aws_instance" "instance" {
  for_each = var.component
  ami           = "ami-03265a0778a880afb"
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_group

  tags = {
    Name = lookup(each.value,"name",null)
  }
}


resource "aws_route53_record" "record" {
  for_each = var.component
  zone_id = var.zone_id
  name    = "${lookup(each.value,"name", null)}.devopsb17.online"
  type    = "A"
  ttl     = 30
  records =[lookup(lookup(aws_instance.instance,each.key,null),"private_ip",null)]
}

