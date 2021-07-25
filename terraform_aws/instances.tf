resource "aws_instance" "web_app" {
	ami = var.amis["us-east-1"]
	instance_type = var.instance_type
	key_name = var.ssh_key

	tags = {
		Name = "web_app"
	}

	vpc_security_group_ids = [
		"${aws_security_group.allow_ssh.id}",
		"${aws_security_group.allow_http.id}",
		"${aws_security_group.allow_tls.id}"
	]
}
