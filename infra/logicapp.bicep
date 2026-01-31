param workflows_la_migrate_name string

resource workflows_la_migrate_dev_name_resource 'Microsoft.Logic/workflows@2017-07-01' = {
  name: workflows_la_migrate_name
  location: 'eastus'
  properties: {
    state: 'Enabled'
    definition: {
      '$schema': 'https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#'
      contentVersion: '1.0.0.0'
      parameters: {
        '$connections': {
          defaultValue: {}
          type: 'Object'
        }
      }
      triggers: {
        When_an_HTTP_request_is_received: {
          type: 'Request'
          kind: 'Http'
        }
      }
      actions: {
        Response: {
          runAfter: {}
          type: 'Response'
          kind: 'Http'
          inputs: {
            statusCode: 200
            body: {
              environment: 'dev'
              source: 'portal-original'
              message: 'LOLLL Hello from migrated Logic App'
            }
          }
        }
      }
      outputs: {}
    }
    parameters: {
      '$connections': {
        value: {}
      }
    }
  }
}
