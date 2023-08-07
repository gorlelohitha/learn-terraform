variable "component" {
  default = ["frontend" , "mangodb"]
}
resource "aws_instance" "instance" {
  count  = length(var.component)
  ami                    = "ami-03265a0778a880afb"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-091dc1de6eb5428f3"]

  tags = {
    Name = var.component[count.index]
    name = element(var.component, count.index)
  }
}