
targetScope ='resourceGroup'

resource bicepstoragedemo 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name:'bicepstoragedemo'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'Storage'
}
