/*
 _          _                           __ _       
| |        | |                         / _(_)      
| | ___   _| |__   ___  ___ ___  _ __ | |_ _  __ _ 
| |/ / | | | '_ \ / _ \/ __/ _ \| '_ \|  _| |/ _` |
|   <| |_| | |_) |  __/ (_| (_) | | | | | | | (_| |
|_|\_\\__,_|_.__/ \___|\___\___/|_| |_|_| |_|\__, |
                                              __/ |
                                             |___/ 

                                                 */

resource "local_file" "kube-config-yaml" {
  filename = "${path.cwd}/k8s/kubeconfig.yaml"
  content  = data.aws_s3_bucket_object.kubeconfig_file.body
}