# Accenture-Task

## Adrress to nginx server: 

[Visit nginx server](http://ec2-3-73-74-203.eu-central-1.compute.amazonaws.com/) 

## Terraform
1) Bootstrap contains a code to deploy infrastructure responsible for storing state of an task architecture
2) Modules contains reusable resources to be able to create a virtual machine.

## Script
Scripts contains two files. One will install nginx in proxy server. Additionaly it will add option to serve as a load blancer. Second one is responsible for serving static html site.

## Ansible
Ansible playbook is responsible for installing and configure amazon cloudwatch agent. It will enables transfering logs from vms to dashboard.