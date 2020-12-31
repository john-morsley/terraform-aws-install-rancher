/* 
  ____        _               _       
 / __ \      | |             | |      
| |  | |_   _| |_ _ __  _   _| |_ ___ 
| |  | | | | | __| '_ \| | | | __/ __|
| |__| | |_| | |_| |_) | |_| | |_\__ \
 \____/ \__,_|\__| .__/ \__,_|\__|___/
                 | |                  
                 |_|                  
                                    */

//output "kubeconfig_file" {
//  value = data.aws_s3_bucket_object.kubeconfig_file.body
//}

//output "infrastructure-rancher-remote-state" {
//  value = data.terraform_remote_state.infrastructure-rancher.outputs
//}
//
//output "kubeconfig_file_yaml" {
//  value = yamldecode(data.aws_s3_bucket_object.kubeconfig_file.body)
//}
//
//output "cluster_server" {
//  value = yamldecode(data.aws_s3_bucket_object.kubeconfig_file.body).clusters[0].cluster.server
//}
//
//output "cluster_client_certificate" {
//  value = yamldecode(data.aws_s3_bucket_object.kubeconfig_file.body).users[0].user.client-certificate-data
//}
//
//output "cluster_client_key" {
//  value = yamldecode(data.aws_s3_bucket_object.kubeconfig_file.body).users[0].user.client-key-data
//}
//
//output "cluster_ca_certificate" {
//  value = yamldecode(data.aws_s3_bucket_object.kubeconfig_file.body).clusters[0].cluster.certificate-authority-data
//}