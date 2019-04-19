update-roles:
	ansible-galaxy install -r requirements.yml --force -p roles/

run-ansible-dev: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i -var-file=src/terraform/dev/azure_rm.py playbook.yml

run-ansible-stg: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i stg/azure_rm.py playbook.yml

run-ansible-prd-ec2: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i prd-ec2/azure_rm.py playbook.yml

run-ansible-prd-ce: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i prd-ce/azure_rm.py playbook.yml		

run-ansible-all: run-ansible-dev run-ansible-stg run-ansible-prd-ec2 run-ansible-prd-ce