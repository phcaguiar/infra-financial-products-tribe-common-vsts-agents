update-roles:
	ansible-galaxy install -r requirements.yml --force -p roles/

run-ansible-dev: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/dev/azure_rm.py iac-linux-vsts-agent-queue.yml

run-ansible-stg: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/stg/azure_rm.py iac-linux-vsts-agent-queue.yml

run-ansible-prd-ec2: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/prd-ec2/azure_rm.py iac-linux-vsts-agent-queue.yml

run-ansible-prd-ce: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventories/prd-ce/azure_rm.py iac-linux-vsts-agent-queue.yml		

run-ansible-all: run-ansible-dev run-ansible-stg run-ansible-prd-ec2 run-ansible-prd-ce