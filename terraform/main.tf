module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source = "./modules/eks"

  project_name       = var.project_name
  cluster_name       = var.cluster_name
  # kubernetes_version = var.kubernetes_version
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids

  node_instance_type = var.eks_node_instance_type
  node_desired_size  = var.eks_node_desired_size
  node_min_size      = var.eks_node_min_size
  node_max_size      = var.eks_node_max_size
}

module "rds" {
  source = "./modules/rds"

  cluster_identifier      = var.rds_cluster_identifier
  engine                  = var.rds_engine
  instance_class          = var.rds_instance_class
  storage_type            = var.rds_storage_type
  allocated_storage       = var.rds_allocated_storage
  backup_retention_period = var.rds_backup_retention_period
  vpc_id                  = module.vpc.vpc_id
  vpc_cidr                = module.vpc.vpc_cidr
  private_subnet_ids      = module.vpc.private_subnet_ids
}

module "jenkins_ec2" {
  source = "./modules/jenkins-ec2"

  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]

  instance_type    = var.instance_type
  key_pair_name    = var.key_pair_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
  ami_id           = var.ami_id
}

module "ecr" {
  source = "./modules/ecr"

  project_name          = var.project_name
  repo_name             = var.repo_name
  image_tag_mutability  = var.image_tag_mutability
  scan_on_push          = var.scan_on_push
}

module "s3-elb-logs" {
  source = "./modules/s3-elb-logs"

  project_name        = var.project_name
  bucket_name         = var.bucket_name
  log_retention_days  = var.log_retention_days
}

module "backup" {
  source = "./modules/backup"

  project_name           = var.project_name
  jenkins_instance_arn   = module.jenkins_ec2.jenkins_instance_arn
  backup_schedule        = var.backup_schedule
  backup_retention_days  = var.backup_retention_days
}