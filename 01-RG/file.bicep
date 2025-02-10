targetScope = 'subscription'

resource biceprg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name:'bicep-rg'
  location: 'east us'
}
