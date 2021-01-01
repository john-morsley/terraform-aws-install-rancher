# Terraform - AWS - Install Rancher

Installs Rancher via Helm on a Kubernetes cluster created previously.

Prerequisites:

1 - A Kubernetes cluster created via: https://github.com/john-morsley/terraform-aws-infrastructure-rancher

Terraform commands:

```terraform
terraform init
```

```terraform
terraform apply --auto-approve
```

Once complete you should be able to browse to your domain, in my case https://rancher.morsley.io, and be presented with a 'Welcome to Rancher' page.

If the 'Let's Encrypt environment' (lets_encrypt_environment) is set to 'staging', then any attempt to browse to your URL will result in a 'Not secure' warning. 
This warning can be ignored.
To check things have worked correctly though, click on you browsers security warning (usually in the address bar) and you can inspect the certificate.
It will be invalid and issued by: Fake LE Intermediate X 1

However, if the 'Let's Encrypt environment' (lets_encrypt_environment) is set to 'production', then any attempt to browse to your URL should not result in the above warning.
The process of issuing a certificate is not instant and my take several minutes.
If you check the certificate now, it'll be valid. Mine was issued by 'R3'.

This now needs bootstrapping via: https://github.com/john-morsley/terraform-aws-bootstrap-rancher

---

