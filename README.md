# lufi-aws-deploy

## Terraform-AWS-Deploy

- This terraform plan create the aws Ec2 instance and deploy the lufi application on aws EC2 instance using Ansible configurations.

## Terraform Variables
- Edit the `vars.tf` file to add the variables as per your need.

| Variable name | Value | Description |
| ------------- | ----- | ----------- |
| `aws_region` | us-east-1 | Set the region  |
| `vpc_cidr` | 10.0.0.0/16 | Set the cidr value for the vpc |
| `public_subnet_cidr` | 10.0.1.0/24 | Set the cidr value for the public subnet |
| `user` | ubuntu | Set the EC2 instance user name |
| `public_key` | /home/user_name/.ssh/id_rsa_pub | Set the publickey value for the ec2 instance from the host machine |
| `private_key` | /home/user_name/.ssh/id_rsa | Set the private key value for the ec2 instance from the hostmachine |
| `aws_access_key` | AWSACCESSKEY | Enter your aws access key |
| `aws_secrete_key` | AWSSECRETEKEY | Enter your aws secrete key

## Provide playbook 

- Enter into the terraform-aws-deploy directory
```yaml
cd terraform-aws-deploy
``` 
- Edit the `main.tf` template to add the path of ansible palybook.yml 
```yaml
provisioner "local-exec" {
    command = <<EOT
      sleep 30;
	  >hosts;
	  echo "[Lufi]" | tee -a hosts;
      echo "${aws_instance.ec2_instance.public_ip} ansible_user=${var.user} ansible_ssh_private_key_file=${var.private_key}" | tee -a hosts;
      export ANSIBLE_HOST_KEY_CHECKING=False;
	    ansible-playbook -u ${var.user} --private-key ${var.private_key} -i hosts  path_of_palybook.yml 
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










