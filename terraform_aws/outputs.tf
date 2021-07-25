# Ansible inventory
resource "local_file" "AnsibleInventory" {
    content = templatefile("templates/hosts.tmpl", {
        web_app-dns = aws_instance.web_app.public_dns,
        web_app-ip = aws_instance.web_app.public_ip,
        web_app-id = aws_instance.web_app.id
    })
    filename = "../ansible/hosts"
}