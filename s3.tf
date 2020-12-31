/*
  _____   ____  
 / ____| |___ \ 
| (___     __) |
 \___ \   |__ < 
 ____) |  ___) |
|_____/  |____/ 
                 
               */

data "aws_s3_bucket_object" "kubeconfig_file" {
  bucket = data.terraform_remote_state.infrastructure-rancher.outputs.cluster_bucket_name
  key    = var.kubeconfig_file_name
}