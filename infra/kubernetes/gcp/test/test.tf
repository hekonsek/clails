provider "google" {
  project     = "PROJECT"
  region      = "us-central1"
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.kubernetes.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.kubernetes.ca_certificate)
}


module "kubernetes" {
  source = "./.."

  project = "PROJECT"
  region = "us-central1"
  name = "clails-test"
  subnet = "us-central1"
  vpc = "clails-test"
}