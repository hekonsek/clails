provider "google" {
  project     = "PROJECT"
  region      = "us-central1"
}

module "vpc" {
  source = "./.."

  project = "PROJECT"
  region = "us-central1"
  name = "clails-test"
}