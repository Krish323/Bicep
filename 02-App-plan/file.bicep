targetScope = 'resourceGroup'

param Plan string = 'myplan'
param webapp string = 'myapp3423d'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: Plan
  location: resourceGroup().location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: webapp
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', Plan) 
  }
  dependsOn: [
    appServicePlan
  ]
}





