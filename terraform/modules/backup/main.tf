resource "aws_backup_vault" "main" {
  name = "${var.project_name}-backup-vault"
}

resource "aws_backup_plan" "main" {
  name = "${var.project_name}-jenkins-backup-plan"

  rule {
    rule_name         = "daily-jenkins-snapshot"
    target_vault_name = aws_backup_vault.main.name
    schedule          = var.backup_schedule

    lifecycle {
      delete_after = var.backup_retention_days
    }
  }
}

# IAM role AWS Backup assumes to actually perform the backup operation
resource "aws_iam_role" "backup" {
  name = "${var.project_name}-backup-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "backup.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "backup_policy" {
  role       = aws_iam_role.backup.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

# Links the Jenkins EC2 instance to the backup plan
resource "aws_backup_selection" "jenkins" {
  name         = "${var.project_name}-jenkins-selection"
  plan_id      = aws_backup_plan.main.id
  iam_role_arn = aws_iam_role.backup.arn

  resources = [
    var.jenkins_instance_arn
  ]

  depends_on = [aws_iam_role_policy_attachment.backup_policy]
}