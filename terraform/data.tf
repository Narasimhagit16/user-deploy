###############################################################################
# APP_ALB SG ids
###############################################################################

data "aws_ssm_parameter" "app_alb_sg_id" {
    name = "/${var.project_name}/${var.environment}/app_alb_sg_id"
  
}

data "aws_ssm_parameter" "user_sg_id" {
    name = "/${var.project_name}/${var.environment}/user_sg_id"
  
}


###############################################################################
# private Subnet ids
###############################################################################


data "aws_ssm_parameter" "private_subnet_ids" {
    name = "/${var.project_name}/${var.environment}/private_subnet_ids"
  
}


###############################################################################
# AMI id
###############################################################################

data "aws_ami" "ami-id" {

  most_recent      = true
  owners           = ["973714476881"]

 filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }


 filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

    filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

########################################################################
# 
########################################################################


data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "public_subnet_id" {
    vpc_id = data.aws_vpc.default.id
    availability_zone = "us-east-1a"

}

data "aws_ssm_parameter" "vpn_sg_id" {
    name = "/${var.project_name}/${var.environment}/vpn_sg_id"
  
}

data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project_name}/${var.environment}/vpcid"
  
}

data "aws_ssm_parameter" "app_alb_listener_arn" {
    name = "/${var.project_name}/${var.environment}/app_alb_listener_arn"
  
}