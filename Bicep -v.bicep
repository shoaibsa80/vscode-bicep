param location string = resourceGroup().location

@minLength(3)
@maxLength(24)
param name  string =  'bicepdemo-SGA-ccount'

@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_ZRS'
])
param type  string = 'Standrad_LRS'

var containerName = 'images'

resource static 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: name
  location: location
  sku: {
    name: type
  }
  kind: 'StorageV2'
  
}

resource container  'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: ${stacc.name}/default/${containerName}
  
}

output storageId string = stacc.name
