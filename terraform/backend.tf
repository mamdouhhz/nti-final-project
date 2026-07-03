terraform {
  backend "s3" {
    bucket = "prj-8274"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
