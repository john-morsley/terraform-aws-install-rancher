data "terraform_remote_state" "infrastructure-rancher" {

  backend = "s3"

  config = {
    bucket = "morsley-io-terraform-backend-states"
    key    = "rancher/infrastructure"
    region = "eu-west-2"
  }

}