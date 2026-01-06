



module "vpc" {
  source     = "../modules/vpcmod"
  vpc_cidr   = var.vpc_cidr
  region_azs = var.region_azs
}

module "s3" {
  source      = "../modules/s3mod"
  bucket_name = var.bucket_name
}

module "security_group" {
  source = "../modules/srtgrpmod"
  vpc_id = module.vpc.vpc_id
}

module "iam_ec2_s3_role" {
  source        = "../modules/rolemod"
  s3_bucket_arn = module.s3.bucket_arn
}

module "ec2" {
  source                = "../modules/ec2mod"
  subnet_id             = module.vpc.public_subnet_id
  security_group_id     = module.security_group.security_group_id
  instance_profile_name = module.iam_ec2_s3_role.instance_profile_name
}

module "rds" {
  source             = "../modules/rdsmod"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  app_sg_id          = module.security_group.security_group_id
}


