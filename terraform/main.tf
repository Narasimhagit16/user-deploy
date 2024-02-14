
module user{
  source = "git::https://github.com/Narasimhagit16/terraform-roboshop-app.git?ref=main"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  ami_id = data.aws_ami.ami-id.id
  instance_type = "t2.micro"
  app-name_sg_id = data.aws_ssm_parameter.user_sg_id.value
  private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  zone_name =var.zone_name
  
  rule_priority = 40  

  environment=var.environment
  project_name = var.project_name
  tags=var.tags
  
  common_tags = var.common_tags
  app_version=var.app_version
  iam_instance_profile=var.iam_instance_profile
  
}