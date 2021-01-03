/*
 _____                _     _               
|  __ \              (_)   | |              
| |__) | __ _____   ___  __| | ___ _ __ ___ 
|  ___/ '__/ _ \ \ / / |/ _` |/ _ \ '__/ __|
| |   | | | (_) \ V /| | (_| |  __/ |  \__ \
|_|   |_|  \___/ \_/ |_|\__,_|\___|_|  |___/
                                             
                                          */

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

provider "aws" {}

# https://registry.terraform.io/providers/hashicorp/helm/latest/docs

provider "helm" {

  kubernetes {

    #host                   = local.cluster_server
    #cluster_ca_certificate = local.cluster_ca_certificate
    #client_certificate     = local.user_client_certificate
    #client_key             = local.user_client_key

    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
    
  }

}

# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs

provider "kubernetes" {

  load_config_file = false

  #host                   = local.cluster_server
  #cluster_ca_certificate = local.cluster_ca_certificate
  #client_certificate     = local.user_client_certificate
  #client_key             = local.user_client_key

  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  
}