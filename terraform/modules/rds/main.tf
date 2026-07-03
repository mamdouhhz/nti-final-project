resource "aws_db_subnet_group" "rds" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "rds" {
  name   = "${var.cluster_identifier}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = var.cluster_identifier
  engine                  = var.engine
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type   # gp2 is fine here
  db_name                 = local.database_name
  username                = local.username
  password                = local.password
  db_subnet_group_name    = aws_db_subnet_group.rds.name
  vpc_security_group_ids  = [aws_security_group.rds.id]
  skip_final_snapshot     = true
  multi_az                = false   # set true later if you want real HA on a bigger class
}

# resource "aws_rds_cluster" "mysql-cluster" {
#   cluster_identifier        = var.cluster_identifier
#   availability_zones        = var.availability_zones
#   database_name             = local.database_name
#   master_username           = local.username
#   master_password           = local.password
#   engine                    = var.engine
#   db_cluster_instance_class = var.instance_class
#   storage_type              = var.storage_type
#   allocated_storage         = var.allocated_storage
#   iops                      = var.iops
#   backup_retention_period   = var.backup_retention_period
#   preferred_backup_window   = var.preferred_backup_window
#   skip_final_snapshot       = true

#   # db_subnet_group_name
#   # vpc_security_group_ids

#   # for production, you may want to enable these options
#   # storage_encrypted        = true
#   # deletion_protection      = true
#   # copy_tags_to_snapshot    = true
#   # apply_immediately        = false
#   # skip_final_snapshot      = false 
# }