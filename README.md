# lufi-aws-deploy
This deploy the lufi application on EC2 instance using the Terraform(Infrastructure) and Ansible(Configuration)

# How to run application

## Clone the repo
```sh
git clone https://github.com/arunodhayamsam/lufi-aws-deploy.git
```

## Submodule update

Put the below command after cloning the repository for update the git submodule to get the content from submodule repositoy

```sh
cd lufi-aws-deploy

git submodule update --init

```
## Create the playbook for task running

Create the `sites.yaml` ansible playbook for access the ansible-roles to application runing.

```yaml
#sites.yaml

- hosts: all
  become: true
  roles:
    - <path_to_ansible-role-lufi>

```    

## Provide a path of playbook 
> **_NOTE:_**   Provide the path of created `sites.yaml` to <path_to_playbook's_site.yml>  .

Enter into the terraform-aws-deploy directory
```yaml
cd terraform-aws-deploy
``` 
Edit the `main.tf` template to add the path of ansible palybook.yml 
```yaml
provisioner "local-exec" {
    command = <<EOT
      sleep 30;
	  >hosts;
	  echo "[Lufi]" | tee -a hosts;
      echo "${aws_instance.ec2_instance.public_ip} ansible_user=${var.user} ansible_ssh_private_key_file=${var.private_key}" | tee -a hosts;
      export ANSIBLE_HOST_KEY_CHECKING=False;
	    ansible-playbook -u ${var.user} --private-key ${var.private_key} -i hosts <path_to_playbook's_site.yml> 
    EOT
  }
```  
## Run the Terraform template
```sh
terraform init
terraform plan 
terraform apply
```
## Contributing
Don’t hesitate to create a pull request










