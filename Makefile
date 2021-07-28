.PHONY: all staging production destroystaging destroy

all: staging

staging:
	cd Vagrant && \
	vagrant up && \
	cd ../ansible && \
	ansible-playbook ./provisioning.yml -i staging

destroystaging:
	cd Vagrant && \
	vagrant destroy -f

production:
	cd terraform_aws && \
	terraform apply && \
	cd ../ansible && \
	ansible-playbook ./provisioning.yml -i hosts

destroy:
	cd terraform_aws && \
	terraform apply -destroy
