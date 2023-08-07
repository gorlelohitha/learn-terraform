varibele "ami" {
  default = "ami-03265a0778a880afb"
}
variable "security_group" {
  default =  ["sg-0d4ae6cf839bb7a89"]

}
variable "instance_type" {
  default = "t3.small"
}

variable "zone_id" {
  default = "Z01549722JL2MSDGK9YRB"
}

variable "component" {
  default = {
    frontend = {name= "frontend-dev"}
    mongodb = {}
    catalogue = {}
    user = {}
    redis = {}
    cart = {}
    mysql = {}
    shipping = {}
    rabbitmq = {}
    payment = {}
  }
}





resource "aws_instance" "frontend" {
  for_each = var.component
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0d4ae6cf839bb7a89" ]




  tags = {
    Name = lookup(each.value,"name",null)
  }
}


resource "aws_route53_record" "frontend" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "frontend-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "mongodb-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids =[ "sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "catalogue"
  }
}


resource "aws_route53_record" "catalogue" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "catalogue-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}


resource "aws_instance" "redis" {
  ami                    = "ami-03265a0778a880afb"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-0d4ae6cf839bb7a89"]

  tags = {
    Name = "redis"
  }
}
resource "aws_route53_record" "redis" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "redis-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids =[ "sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "user"
  }
}
resource "aws_route53_record" "user" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "user-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}







resource "aws_instance" "cart" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "cart-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "mysql-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [" sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "shipping"
  }
}
resource "aws_route53_record" "shipping" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "shipping-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [" sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "rabbitmq"
  }
}
resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "shipping-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [" sg-0d4ae6cf839bb7a89" ]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z01549722JL2MSDGK9YRB"
  name    = "payment-dev.devopsb17.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}





