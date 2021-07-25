#Ref. https://www.youtube.com/watch?v=VKBCKhA7G8A
resource "google_service_account" "juan-camargo" {
	account_id 	= "juan-camargo"
}

resource "google_project_service" "api" {
	for_each = toset([
		"cloudresourcemanager.googleapis.com",
		"compute.googleapis.com"
	])
	disable_on_destroy = false
	service = each.value
}

resource "google_compute_firewall" "web" {
	name = "web-access"
	network = "default"
	source_ranges = ["0.0.0.0/0"]
	allow {
		protocol = "tcp"
		ports = ["80", "433"]
	}
}

resource "google_compute_instance" "web_app" {
	name         = "web_app"
	machine_type = var.instance_type

	boot_disk {
		initialize_params {
			image = "debian-cloud/debian-9"
		}
	}

	network_interface {
		network = "default" //enable private IP address
		access_config {} //enable public IP address
	}

	depends_on = [
		google_project_service.api,
		google_compute_firewall.web
	]
}