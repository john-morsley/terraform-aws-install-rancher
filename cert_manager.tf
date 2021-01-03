/*
  _____          _          __  __                                   
 / ____|        | |        |  \/  |                                  
| |     ___ _ __| |_ ______| \  / | __ _ _ __   __ _  __ _  ___ _ __ 
| |    / _ \ '__| __|______| |\/| |/ _` | '_ \ / _` |/ _` |/ _ \ '__|
| |___|  __/ |  | |_       | |  | | (_| | | | | (_| | (_| |  __/ |   
 \_____\___|_|   \__|      |_|  |_|\__,_|_| |_|\__,_|\__, |\___|_|   
                                                      __/ |          
                                                     |___/         */

# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace

resource "kubernetes_namespace" "cert-manager" {

  metadata {
    //    annotations = {
    //      name = "example-annotation"
    //    }
    //
    //    labels = {
    //      mylabel = "label-value"
    //    }

    name = "cert-manager"
  }

}

# https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release

resource "helm_release" "cert_manager" {
  //depends_on = [null_resource.cert-manager-crds]
  version    = "v${var.cert_manager_version}"
  name       = "cert-manager"
  chart      = var.cert_manager_helm_chart
  namespace  = "cert-manager"
  repository = var.cert_manager_helm_repository

  set {
    name  = "installCRDs"
    value = "true"
  }

  # Bogus set to link together resources for proper tear down
  //set {
  //  name  = "tf_link"
  //  value = rke_cluster.rancher_server.api_server_url
  //}

  depends_on = [
    kubernetes_namespace.cert-manager
  ]

}