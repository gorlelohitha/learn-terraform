variable "fruits" {
  default = [ "apple","kevi"]
}
output "fruits" {
  value = element(var.fruits, 2)
}