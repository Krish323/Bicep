targetScope = 'subscription'

resource testrg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'test-rg'
  location: 'east us'
}
