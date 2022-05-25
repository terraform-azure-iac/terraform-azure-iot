# IoT for monitoring off Vehicles

## Info / intro

This module sets up in infrastructure that can recive IoT data from Vehicles and analyze the data and present it to a user. The infrastructure also provisons resources that can be configured to send notification to the end user. This module easly also be used for IoT data from other sources, or configured and cusotmixed to fit differnt requirments and needs.

A [Rasbery PI IoT simulator](https://azure-samples.github.io/raspberry-pi-web-simulator/) can be used to test the iot module and infrastructure. It can be used as an iot-device and send msg to Azure (IotHub, IoT Central, Eventhub).

![iot-vehicles-resources-norway.png](/img/iot-vehicles-resources-norway.png)

## Configure Module
- Naming for resources 
- Location 
- Tier, Size, sku, capacity and Version of the resources
- Cache fot kusto db
- msg retention
- data format
- replication type
- encryption type
- db tabel throughput 
- network: address spaces
- powerbi admins



--------------------------------------
## Terraform documentation 

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management.api_managment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |
| [azurerm_app_service.app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service) | resource |
| [azurerm_app_service_plan.app_service_plan_function](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_app_service_plan.app_service_plan_gui](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_cosmosdb_account.cosmosdb_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurerm_cosmosdb_sql_database.cosmosdb_sql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_database) | resource |
| [azurerm_eventhub.eventhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_authorization_rule.eventhub_auth_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) | resource |
| [azurerm_eventhub_consumer_group.eventhub_consumer_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_consumer_group) | resource |
| [azurerm_eventhub_namespace.eventhub_namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_function_app.function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app) | resource |
| [azurerm_iothub.iothub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/iothub) | resource |
| [azurerm_resource_group.iot](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_data_lake_gen2_filesystem.data_lake_gen2_file](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_data_lake_gen2_filesystem) | resource |
| [azurerm_stream_analytics_job.stream_analytics_job](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_job) | resource |
| [random_integer.int](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Should Default be changed? |
|------|-------------|------|---------|:--------:|
| <a name="input_api_managment_name"></a> [api\_managment\_name](#input\_api\_managment\_name) | API Managment Service | `string` | `"api-managment"` | no |
| <a name="input_api_managment_publisher_email"></a> [api\_managment\_publisher\_email](#input\_api\_managment\_publisher\_email) | n/a | `string` | `"test@test.com"` | yes |
| <a name="input_api_managment_publisher_name"></a> [api\_managment\_publisher\_name](#input\_api\_managment\_publisher\_name) | n/a | `string` | `"secure-and-compliant-iac"` | no |
| <a name="input_api_managment_sku"></a> [api\_managment\_sku](#input\_api\_managment\_sku) | n/a | `string` | `"Basic_1"` | no |
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | n/a | `string` | `"app-service-user-interface"` | yes |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | App Service | `string` | `"app-service-plan-user-interface"` | yes |
| <a name="input_app_service_plan_name_function"></a> [app\_service\_plan\_name\_function](#input\_app\_service\_plan\_name\_function) | n/a | `string` | `"app-service-plan-iot-vehivels"` | yes |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | CosmosDB | `string` | `"cosmosdb-account-iot-vehicles"` | yes |
| <a name="input_cosmosdb_sql_db_throughput"></a> [cosmosdb\_sql\_db\_throughput](#input\_cosmosdb\_sql\_db\_throughput) | n/a | `number` | `600` | no |
| <a name="input_data_lake_gen2_file_name"></a> [data\_lake\_gen2\_file\_name](#input\_data\_lake\_gen2\_file\_name) | Data Lake | `string` | `"data-lake-filesystem"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_eventhub_auth_rule_name"></a> [eventhub\_auth\_rule\_name](#input\_eventhub\_auth\_rule\_name) | n/a | `string` | `"eventhub-authorization-rule"` | yes |
| <a name="input_eventhub_consumer_group_name"></a> [eventhub\_consumer\_group\_name](#input\_eventhub\_consumer\_group\_name) | n/a | `string` | `"eventhub-consumer-group"` | yes |
| <a name="input_eventhub_consumer_group_user_data"></a> [eventhub\_consumer\_group\_user\_data](#input\_eventhub\_consumer\_group\_user\_data) | Usermetadata is a placeholder to store user-defined string data with maximum length 1024. e.g. it can be used to store descriptive data, such as list of teams and their contact information also user-defined configuration settings can be stored. | `string` | `"some-meta-data"` | no |
| <a name="input_eventhub_message_retention"></a> [eventhub\_message\_retention](#input\_eventhub\_message\_retention) | n/a | `number` | `7` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | n/a | `string` | `"event-hub"` | yes |
| <a name="input_eventhub_namespace_capacity"></a> [eventhub\_namespace\_capacity](#input\_eventhub\_namespace\_capacity) | n/a | `number` | `2` | no |
| <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name) | Eventhub | `string` | `"eventhub-namespace-ntnu-bachelor-2022"` | yes |
| <a name="input_eventhub_namespace_sku"></a> [eventhub\_namespace\_sku](#input\_eventhub\_namespace\_sku) | n/a | `string` | `"Standard"` | no |
| <a name="input_eventhub_partition_count"></a> [eventhub\_partition\_count](#input\_eventhub\_partition\_count) | n/a | `number` | `2` | no |
| <a name="input_function_app_name"></a> [function\_app\_name](#input\_function\_app\_name) | n/a | `string` | `"function-app-ntnu-bach-22"` | yes |
| <a name="input_iotcentral_application_name"></a> [iotcentral\_application\_name](#input\_iotcentral\_application\_name) | IoT Central | `string` | `"iot-central-application-ntnu-bachelor-2022"` | yes |
| <a name="input_iotcentral_application_sku"></a> [iotcentral\_application\_sku](#input\_iotcentral\_application\_sku) | n/a | `string` | `"ST1"` | no |
| <a name="input_iotcentral_application_subdomain"></a> [iotcentral\_application\_subdomain](#input\_iotcentral\_application\_subdomain) | n/a | `string` | `"iot-central-application-subdomain"` | yes |
| <a name="input_iothub_name"></a> [iothub\_name](#input\_iothub\_name) | IotHub | `string` | `"iot-hub-ntnu-bachelor-2022"` | yes |
| <a name="input_iothub_sku_capacity"></a> [iothub\_sku\_capacity](#input\_iothub\_sku\_capacity) | n/a | `string` | `"1"` | no |
| <a name="input_iothub_sku_name"></a> [iothub\_sku\_name](#input\_iothub\_sku\_name) | n/a | `string` | `"B1"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"norwayeast"` | no |
| <a name="input_notification_hub_name"></a> [notification\_hub\_name](#input\_notification\_hub\_name) | n/a | `string` | `"notification-hub"` | yes |
| <a name="input_notification_hub_namespace_name"></a> [notification\_hub\_namespace\_name](#input\_notification\_hub\_namespace\_name) | Notification Hubs | `string` | `"notification-hub-namespace-ntnu-bach-22"` | yes |
| <a name="input_notification_hub_namespace_sku"></a> [notification\_hub\_namespace\_sku](#input\_notification\_hub\_namespace\_sku) | n/a | `string` | `"Free"` | no |
| <a name="input_powerbi_embedded_admins"></a> [powerbi\_embedded\_admins](#input\_powerbi\_embedded\_admins) | n/a | `list` | <pre>[<br>  "adminTest@test.no"<br>]</pre> | yes |
| <a name="input_powerbi_embedded_name"></a> [powerbi\_embedded\_name](#input\_powerbi\_embedded\_name) | Power BI | `string` | `"powerbiembedded"` | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"IoT-vehicles"` | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Function App | `string` | `"storacciotvehicel"` | yes |
| <a name="input_stream_analytics_job_compatability_level"></a> [stream\_analytics\_job\_compatability\_level](#input\_stream\_analytics\_job\_compatability\_level) | n/a | `string` | `"1.2"` | no |
| <a name="input_stream_analytics_job_name"></a> [stream\_analytics\_job\_name](#input\_stream\_analytics\_job\_name) | n/a | `string` | `"stream-analytics-job"` | yes |
| <a name="input_stream_analytics_job_streaming_units"></a> [stream\_analytics\_job\_streaming\_units](#input\_stream\_analytics\_job\_streaming\_units) | n/a | `number` | `3` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_managment_id"></a> [api\_managment\_id](#output\_api\_managment\_id) | n/a |
| <a name="output_app_service_id"></a> [app\_service\_id](#output\_app\_service\_id) | n/a |
| <a name="output_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#output\_cosmosdb\_account\_id) | n/a |
| <a name="output_cosmosdb_sql_db_id"></a> [cosmosdb\_sql\_db\_id](#output\_cosmosdb\_sql\_db\_id) | n/a |
| <a name="output_data_lake_gen2_file_id"></a> [data\_lake\_gen2\_file\_id](#output\_data\_lake\_gen2\_file\_id) | n/a |
| <a name="output_eventhub_id"></a> [eventhub\_id](#output\_eventhub\_id) | n/a |
| <a name="output_eventhub_namespace_id"></a> [eventhub\_namespace\_id](#output\_eventhub\_namespace\_id) | n/a |
| <a name="output_function_app_id"></a> [function\_app\_id](#output\_function\_app\_id) | n/a |
| <a name="output_iothub_id"></a> [iothub\_id](#output\_iothub\_id) | n/a |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_stream_analytics_job_id"></a> [stream\_analytics\_job\_id](#output\_stream\_analytics\_job\_id) | n/a |



------------------------------------------



### Resources not in the module
Resources not added in the module because they are not available in Norway when this was created. 
- Notification hub -> To send notifications to multiple recivers.

- IoT central -> Easier resources to use with simlar functionality and area of use as IoT Hub, but not availbel in Norway. Not used in the module becasoue the use of resources can cause complance issues, especaly in sectors like helth and coverment. 


---------------------------------------------