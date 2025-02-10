# creating resource group and app service plan and web app

cd "D:\Bicep\Bicep\03-App-plan-modify"

az deployment group create --resource-group bicep-rg --template-file file.bicep -c

