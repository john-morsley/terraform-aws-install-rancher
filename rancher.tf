/*
 _____                  _               
|  __ \                | |              
| |__) |__ _ _ __   ___| |__   ___ _ __ 
|  _  // _` | '_ \ / __| '_ \ / _ \ '__|
| | \ \ (_| | | | | (__| | | |  __/ |   
|_|  \_\__,_|_| |_|\___|_| |_|\___|_|   
                                         
                                       */

resource "kubernetes_namespace" "cattle-system" {

  metadata {
    //    annotations = {
    //      name = "example-annotation"
    //    }
    //
    //    labels = {
    //      mylabel = "label-value"
    //    }

    name = "cattle-system"
  }

  //  timeouts {
  //    create = "5m"
  //    delete = "30m"
  //  }

}

resource "helm_release" "rancher" {

  name       = "rancher"
  repository = var.rancher_helm_repository
  chart      = var.rancher_helm_chart
  version    = "v${var.rancher_helm_version}"
  namespace  = "cattle-system"

  set {
    name  = "hostname"
    value = "${var.sub_domain}.${var.domain}"
  }

  set {
    name  = "ingress.tls.source"
    value = "letsEncrypt"
  }

  set {
    name  = "letsEncrypt.email"
    value = var.lets_encrypt_email
  }

  set {
    name  = "letsEncrypt.environment"
    value = var.lets_encrypt_environment
  }

  # Bogus set to link togeather resources for proper tear down
  //  set {
  //    name  = "tf_link"
  //    value = helm_release.cert_manager.name
  //  }

  depends_on = [
    kubernetes_namespace.cattle-system,
    helm_release.cert_manager
  ]

}