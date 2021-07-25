resource "aws_security_group" "allow_ssh" {
	name        = "allow_ssh"
	description = "Allow SSH traffic"

	ingress {
		description = "SSH"
		from_port 	= 22
		to_port 	= 22
		protocol 	= "tcp"
		cidr_blocks = var.cdirs_remote_access
	}

	tags = {
		Name = "ssh"
	}
}

resource "aws_security_group" "allow_tls" {
	name        = "allow_tls"
	description = "Allow TLS inbound traffic"

	ingress {
		description      = "Allow TLS"
		from_port        = 443
		to_port          = 443
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	egress {
		from_port        = 443
		to_port          = 443
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	tags = {
		Name = "allow_tls"
	}
}

resource "aws_security_group" "allow_http" {
	name        = "allow_http"
	description = "Allow HTTP inbound traffic"

	ingress {
		description      = "Allow HTTP"
		from_port        = 80
		to_port          = 80
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	egress {
		from_port        = 80
		to_port          = 80
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	tags = {
		Name = "allow_http"
	}
}
