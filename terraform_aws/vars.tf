variable "amis" {
    type = map
    default = {
        "us-east-1" = "ami-09e67e426f25ce0d7"
    }
}

variable "cdirs_remote_access" {
    type    = list(string)
    default = ["189.120.77.146/32"]
}

variable "instance_type" {
    type        = string
    default = "t2.micro"
}

variable "ssh_key" {
    type        = string
    default = "terraform-aws_id"
}
