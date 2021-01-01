/*
 _____                      _          _____ _        _       
|  __ \                    | |        / ____| |      | |      
| |__) |___ _ __ ___   ___ | |_ ___  | (___ | |_ __ _| |_ ___ 
|  _  // _ \ '_ ` _ \ / _ \| __/ _ \  \___ \| __/ _` | __/ _ \
| | \ \  __/ | | | | | (_) | ||  __/  ____) | || (_| | ||  __/
|_|  \_\___|_| |_| |_|\___/ \__\___| |_____/ \__\__,_|\__\___|
                                                               
                                                             */


data "terraform_remote_state" "infrastructure-rancher" {

  backend = "s3"

  config = {
    bucket = "morsley-io-terraform-backend-states"
    key    = "rancher/infrastructure"
    region = "eu-west-2"
  }

}