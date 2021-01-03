/*																					  
 _____        _        
|  __ \      | |       
| |  | | __ _| |_ __ _ 
| |  | |/ _` | __/ _` |
| |__| | (_| | || (_| |
|_____/ \__,_|\__\__,_|
                       
                     */

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.infrastructure-rancher.outputs.cluster_id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.infrastructure-rancher.outputs.cluster_id
}