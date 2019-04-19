update-roles:
	ansible-galaxy install -r requirements.yml --force -p src/ansible/roles

init:
	terraform init src/terraform/

validate-dev:
	terraform validate -var-file=src/terraform/dev.tfvars src/terraform/

validate-stg:
	terraform validate -var-file=src/terraform/stg.tfvars src/terraform/

validate-prd-ec2:
	terraform validate -var-file=src/terraform/prd-ec2.tfvars src/terraform/

validate-prd-ce:
	terraform validate -var-file=src/terraform/prd-ce.tfvars src/terraform/

plan-dev: init validate-dev
	terraform plan --var-file=src/terraform/dev.tfvars src/terraform/

plan-stg: init validate-stg
	terraform plan --var-file=src/terraform/stg.tfvars src/terraform/

plan-prd-ec2: init validate-prd-ec2
	terraform plan --var-file=src/terraform/prd-ec2.tfvars src/terraform/

plan-prd-ce: init validate-prd-ce
	terraform plan --var-file=src/terraform/prd-ce.tfvars src/terraform/

apply-dev:
	terraform apply --var-file=src/terraform/dev.tfvars -auto-approve	 src/terraform/
	
apply-stg:
	terraform apply --var-file=src/terraform/stg.tfvars -auto-approve src/terraform/	
	
apply-prd-ec2:
	terraform apply --var-file=src/terraform/prd-ec2.tfvars -auto-approve src/terraform/
	
apply-prd-ce:
	terraform apply --var-file=src/terraform/prd-ce.tfvars -auto-approve src/terraform/

destroy-dev:
	terraform destroy -var-file=dev.tfvars -auto-approve src/terraform/

destroy-stg:
	terraform destroy -var-file=stg.tfvars -auto-approve src/terraform/	

destroy-prd-ec2:
	terraform destroy -var-file=prd-ec2.tfvars -auto-approve src/terraform/	

destroy-prd-ce:
	terraform destroy -var-file=prd-ce.tfvars -auto-approve src/terraform/

run-ansible-dev: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i src/ansible/inventories/dev/azure_rm.py playbook.yml

run-ansible-stg: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i src/ansible/inventories/stg/azure_rm.py playbook.yml

run-ansible-prd-ec2: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i src/ansible/inventories/prd-ec2/azure_rm.py playbook.yml

run-ansible-prd-ce: update-roles
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i src/ansible/inventories/prd-ce/azure_rm.py playbook.yml		

plan-all: init validate-dev validate-stg validate-prd-ec2 validate-prd-ce plan-dev plan-stg plan-prd-ec2 plan-prd-ce

apply-all: apply-dev apply-stg apply-prd-ec2 apply-prd-ce

destroy-all: destroy-dev destroy-stg destroy-prd-ec2 destroy-prd-ce

run-ansible-all: run-ansible-dev run-ansible-stg run-ansible-prd-ec2 run-ansible-prd-ce