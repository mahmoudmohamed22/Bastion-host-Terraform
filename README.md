## Terraform Bastion Host for AWS
This Terraform project creates a Bastion host in AWS to provide secure access to servers within a private network. It creates an EC2 instance in a public subnet and configures it as a Bastion host. It also creates a security group to allow SSH access to the Bastion host from the public internet.

## aws architecture
![bastion host drawio](https://user-images.githubusercontent.com/47304558/232342752-080c4337-1f59-44ab-b07d-18088818b9b1.png)



## Getting started
To use this Terraform project, you will need:

- An AWS account with appropriate permissions to create EC2 instances and security groups.

- Terraform installed on your local machine.

- An SSH key pair to use for accessing the Bastion host.

## To get started:

Clone this repository to your local machine.
```
git clone https://github.com/mahmoudmohamed22/Bastion-host-Terraform
```
Run `terraform init` to download the necessary Terraform plugins.

Run `terraform apply` to create the Bastion host and security group.

Once the Bastion host has been created, you can connect to it using SSH. The Bastion host will be assigned a public IP address, which you can use to connect to it from the public internet. For example:


```
ssh -i /path/to/private/key ec2-user@<bastion-public-ip>
```

Replace /path/to/private/key with the path to your private SSH key, and <bastion-public-ip> with the public IP address of the Bastion host.

## test 
### - when resources created using terraform
![image](https://user-images.githubusercontent.com/47304558/232342111-a3cc734a-4bdc-4801-8603-89593030fbff.png)
![image](https://user-images.githubusercontent.com/47304558/232342202-96696bf7-8989-459b-999e-70a41187fd96.png)


### - when connected ssh from public ec2 instance to private ec2 instance 

![image](https://user-images.githubusercontent.com/47304558/232341832-d396336e-2fae-40c6-a8a6-6629d1813621.png)

### - when terraform destroy resources
![image](https://user-images.githubusercontent.com/47304558/232342499-6fdacd86-7129-460e-b1ef-5a7048db59ef.png)




## Security considerations
The Bastion host is a critical component of the security infrastructure, and should be configured and maintained carefully. Here are some guidelines to follow:

- Only authorized users should be allowed to log in to the Bastion host.

- Strong passwords should be used for all accounts on the Bastion host.

- Two-factor authentication (2FA) should be used for all accounts on the Bastion host, if possible.

- Access to the private network should be restricted to only those users who need it.

- All SSH connections to the Bastion host and private servers should be encrypted using SSH keys or other secure authentication mechanisms.

- Logs should be monitored regularly for signs of unauthorized access or other security breaches.

- The Bastion host and private servers should be kept up-to-date with the latest security patches and software updates.

## License
This Terraform project is licensed under the MIT License. See the LICENSE file for more information.
