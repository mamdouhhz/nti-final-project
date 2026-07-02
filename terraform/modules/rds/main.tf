resource "aws_rds_cluster" "mysql-cluster" {
    cluster_identifier        = var.cluster_identifier
    availability_zones        = module.vpc.availability_zones
    database_name             = local.database_name
    master_username           = local.username
    master_password           = local.password
    engine                    = var.engine
    db_cluster_instance_class = var.instance_class
    storage_type              = var.storage_type
    allocated_storage         = var.allocated_storage
    iops                      = var.iops
    backup_retention_period   = var.backup_retention_period
    preferred_backup_window   = var.preferred_backup_window
    skip_final_snapshot = true

    # db_subnet_group_name
    # vpc_security_group_ids

    # for production, you may want to enable these options
    # storage_encrypted        = true
    # deletion_protection      = true
    # copy_tags_to_snapshot    = true
    # apply_immediately        = false
    # skip_final_snapshot      = false 
}