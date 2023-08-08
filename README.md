Udacity-DevOps-Azure-Project-3 - Ensuring Quality Releases
CI / CD Test Automation Pipeline - Azure DevOps - Terraform - JMeter -Selenium - Postman

Badges

Intro
This project was created to create test environments and run automated tests

Dependencies

Dependency	Link
Packer	https://www.packer.io/
Terraform	https://www.terraform.io/downloads.html
JMeter	https://jmeter.apache.org/download_jmeter.cgi
Postman	https://www.postman.com/downloads/
Python	https://www.python.org/downloads/
Selenium	https://sites.google.com/a/chromium.org/chromedriver/getting-started

Azure Resources

Azure Free account
Azure Storage account (resource)
Azure Log Workspace (resource)
Terraform Service principle (resource)
Azure DevOps Organization ( https://azure.microsoft.com/en-us/services/devops/)
Azure CLI (resource)

Steps

1. Clone repo provided by Udacity:
git clone https://github.com/jfcb853/Udacity-DevOps-Azure-Project-3
2. Open VSCode Terminal and login to Azure Account
az login
3. Display Subscription ID 
az account list
4. Configure Storage Account
./azure-sa.sh
5. Copy the following
access key
storage account name
6. Create a service principal account for ADO with contributor permissions
az ad sp create-for-rbac --name="Project3" --role="Contributor" 
7. Create a RG for VM image for Packer Build
az group create -n RG-PackerImage -l eastus2
packer --version
cd packer
packer build ubuntu-image.json
8. Ensure you copy the following for your terraform.tfvars file
RG Name
Name
Image ID
Image Location
9. Fill in needed values for terraform.tfvars
subscription id
client id
tenant id
location
rg
app type (unique name)
vnet
packer image
username
10. Modify main.tf file to include above values (as needed)
11. 
12. 
13. 
14. 
15. 


Cleanup

Give approval to ADO to Destroy Terraform Stage
Run this script to delete image and storage account RGs
./clean-up-script.sh

Future Improvements

Give a bit more guidance on testing for individuals whose primary focus is not development