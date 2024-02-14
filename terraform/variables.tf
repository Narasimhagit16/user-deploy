variable "environment" {
    type=string
    default = "dev"
  
}

variable "project_name" {
    type= string
    default = "roboshop"
  
}

variable "tags" {
    default = {
        component= "user"
    }
  
}

variable "common_tags" {
    type = map
    default = {}
}

variable "zone_name" {
    type = string
    default = "nariops.online"
  
}

variable "app_version" {
  
}

variable "iam_instance_profile" {
    default = "FullAdminAccess"
  
}