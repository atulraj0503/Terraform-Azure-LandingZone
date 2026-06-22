# Terraform Azure Landing Zone

## Project Overview

Azure Infrastructure deployed using Terraform Modules.

## Architecture

Internet
↓
Application Gateway
↓
Linux VM (Nginx)
↓
NSG
↓
VNet

## Resources Created

- Resource Group
- Virtual Network
- Frontend Subnet
- Backend Subnet
- Azure Bastion Subnet
- Application Gateway Subnet
- Network Security Group
- Linux Virtual Machine
- Azure Bastion
- Azure Application Gateway

## Domain

http://atulraj.online

## Terraform Modules

- resource_group
- network
- nsg
- vm
- bastion
- applicationgateway

## Skills Demonstrated

- Terraform
- Azure Networking
- Azure Bastion
- Application Gateway
- Infrastructure as Code
- Linux Administration