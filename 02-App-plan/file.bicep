targetScope = 'resourceGroup'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: 'myAppServicePlan'
  location: 'West Europe'
  sku: {
    name: 'F1'
    tier: 'Free'
  }
  properties: {
    reserved: false
    isXenon: false
    hyperV: false
  }
}

resource mywebapp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'myapp324589'
  location: 'West Europe'
 
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'myAppServicePlan')
  }
}


