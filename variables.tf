/*
 __      __        _       _     _           
 \ \    / /       (_)     | |   | |          
  \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
    \  / (_| | |  | | (_| | |_) | |  __/\__ \
     \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/
                                             
                                           */

########################################################################################################################
# CLUSTER
########################################################################################################################

variable "kubeconfig_file_name" {
  type        = string
  description = "The name of the kubeconfig file."
  default     = "kubeconfig.yaml"
}

########################################################################################################################
# CERT-MANAGER
########################################################################################################################

variable "cert_manager_helm_repository" {
  type        = string
  default     = "https://charts.jetstack.io"
  description = "Helm chart to use for Cert-Manager install"
}

variable "cert_manager_helm_chart" {
  type        = string
  default     = "cert-manager"
  description = "Helm chart to use for Rancher install"
}

variable "cert_manager_version" {
  type        = string
  description = "Version of Cert-Manager to install."
}

########################################################################################################################
# LET'S ENCRYPT
########################################################################################################################

variable "lets_encrypt_email" {
  type    = string
  default = "john@morsley.io"
}

variable "lets_encrypt_environment" {
  type    = string
  default = "staging" # Valid options are 'staging' or 'production'
}

########################################################################################################################
# RANCHER
########################################################################################################################

variable "sub_domain" {
  type = string
}

variable "domain" {
  type = string
}

variable "rancher_helm_repository" {
  type        = string
  default     = "https://releases.rancher.com/server-charts/latest"
  description = "Helm chart to use for Rancher install"
}

variable "rancher_helm_chart" {
  type        = string
  default     = "rancher"
  description = "Helm chart to use for Rancher install"
}

variable "rancher_helm_version" {
  type        = string
  description = "Version of Rancher to install."
}