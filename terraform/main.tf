module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  vpc_cidr       = var.vpc_cidr
  azs            = var.azs
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source = "./modules/eks"

  project_name        = var.project_name
  cluster_name        = var.cluster_name
  cluster_version     = var.cluster_version
  private_subnet_ids  = module.vpc.private_subnet_ids
  public_subnet_ids   = module.vpc.public_subnet_ids

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
  iops                    = var.rds_iops
  backup_retention_period = var.rds_backup_retention_period
  preferred_backup_window = var.rds_preferred_backup_window
}