
//creating app plan, web and acreate and attach to application insights

targetScope = 'resourceGroup'

param Plan string = 'myplan-test'
param webapp string = 'myapp3423test'


resource testplan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: Plan
  location: resourceGroup().location
  kind: 'linux'
  sku: {
    name: 'F1'
    capacity: 1
    }
    properties: {
      reserved: true
    }
}

resource linuxapp 'Microsoft.Web/sites@2021-01-15' = {
  name: webapp
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', Plan)
  }
  dependsOn: [
    testplan
  ]
}

resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: 'myappinsitetest'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
  dependsOn: [
    linuxapp
  ]
}

resource linuxappconfig 'Microsoft.Web/sites/config@2024-04-01' = {
  name: 'web'
  parent: linuxapp
  properties: {
    appSettings: [
      {
        name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
        value: appInsightsComponents.properties.InstrumentationKey
      }
    ]
  }
}


