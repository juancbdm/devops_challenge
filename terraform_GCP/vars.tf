variable "project_id" {
    type    = string
    default = "juan-camargo"
}

variable "instance_type" {
    type    = string
    default = "e2-micro"
}

variable "zone" {
    type    = string
    default = "southamerica-east1-a"
}

variable "region" {
    type    = string
    default = "southamerica-east1"
}

variable "instance_image" {
    type    = string
    default = "ubuntu-os-cloud/ubuntu-2004-lts"
}
