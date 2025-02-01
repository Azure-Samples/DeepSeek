targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name which is used to generate a short unique hash for each resource')
param environmentName string

@minLength(1)
@description('Location for the OpenAI resource')
@allowed([
  'westus3'
])
param location string

@description('Id of the user or app to assign application roles')
param principalId string = ''

param disableKeyBasedAuth bool = true


var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = { 'azd-env-name': environmentName }

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${environmentName}-rg'
  location: location
  tags: tags
}


var aiServicesNameAndSubdomain = '${resourceToken}-aiservices'
module aiServices 'br/public:avm/res/cognitive-services/account:0.7.2' = {
  name: 'deepseek'
  scope: resourceGroup
  params: {
    name: aiServicesNameAndSubdomain
    location: location
    tags: tags
    kind: 'AIServices'
    customSubDomainName: aiServicesNameAndSubdomain
    sku:  'S0'
    deployments: [
      {
        name: 'DeepSeek-R1'
        model: {
          format: 'DeepSeek'
          name: 'DeepSeek-R1'
          version: '1'
        }
        sku: {
          name: 'GlobalStandard'
          capacity: 1
        }
      }]
    disableLocalAuth: disableKeyBasedAuth
    roleAssignments: [
      {
        principalId: principalId
        principalType: 'User'
        roleDefinitionIdOrName: 'Cognitive Services OpenAI User'
      }
    ]
  }
}



output AZURE_LOCATION string = location
output AZURE_TENANT_ID string = tenant().tenantId
output AZURE_RESOURCE_GROUP string = resourceGroup.name

output AZURE_AISERVICES_ENDPOINT string = aiServices.outputs.endpoint
