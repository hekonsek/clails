module "vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "6.0.0"

  project_id   = var.project

  network_name = var.name
}

module "subnets" {
  source  = "terraform-google-modules/network/google//modules/subnets"
  version = "6.0.0"

  depends_on = [module.vpc]

  project_id   = var.project
  network_name = var.name

  subnets = [
    {
      subnet_name           = var.region
      subnet_region         = var.region
      subnet_ip             = "10.10.10.0/24"
    }
  ]

  secondary_ranges = {
    (var.region) = [
      {
        range_name    = "pods"
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = "services"
        ip_cidr_range = "10.30.0.0/16"
      },
    ]
  }

}