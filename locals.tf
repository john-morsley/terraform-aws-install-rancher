/*
 _                     _     
| |                   | |    
| |     ___   ___ __ _| |___ 
| |    / _ \ / __/ _` | / __|
| |___| (_) | (_| (_| | \__ \
|______\___/ \___\__,_|_|___/
                              
                            */

locals {

  kubeconfig_yaml = yamldecode(data.aws_s3_bucket_object.kubeconfig_file.body)

  cluster_server          = local.kubeconfig_yaml.clusters[0].cluster.server
  cluster_ca_certificate  = base64decode(local.kubeconfig_yaml.clusters[0].cluster.certificate-authority-data)
  user_client_certificate = base64decode(local.kubeconfig_yaml.users[0].user.client-certificate-data)
  user_client_key         = base64decode(local.kubeconfig_yaml.users[0].user.client-key-data)

}