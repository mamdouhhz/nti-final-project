# aws secretsmanager create-secret \
#   --name DBsecret3 \
#   --secret-string '{"database_name":"mysqldb","master_username":"foo","master_password":"bar"}' \
#   --region us-east-2

data "aws_secretsmanager_secret" "example" {
  name = "DBsecret2"
}

data "aws_secretsmanager_secret_version" "example" {
  secret_id = data.aws_secretsmanager_secret.example.id
}

locals {
  db_secret     = jsondecode(data.aws_secretsmanager_secret_version.example.secret_string)
  password      = local.db_secret["master_password"]
  username      = local.db_secret["master_username"]
  database_name = local.db_secret["database_name"]
}