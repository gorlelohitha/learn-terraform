# variable datatype
variable "fruit_stock" {
  default = {
    apple = {
      type = "washington"
      stock = 1
      for_sale = true
    }
  }
}

# variable combination  of string other that that
variable "fruits_info" {
  default = {
    apple = {
      stock    = 100
      type     = "washington"
      for-sale = true
    }
  }
}


output "fruits-info" {
  value = "apple_stock = ${ fruit_info ["apple"].stock}"

}




