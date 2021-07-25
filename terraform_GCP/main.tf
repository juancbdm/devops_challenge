terraform {
	required_providers {
		google = {
			source = "hashicorp/google"
		}
	}
}

provider "google" {
	credentials = file("credentials-gcp.json")
	project = var.project_id
	region = var.region
	zone = var.zone
}