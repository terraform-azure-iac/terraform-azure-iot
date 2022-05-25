# Monitoring



## Info / intro

This module sets up resources to monitor the IoT cloud infrastrcture



## Configure Module
- Set the email recivers 
- Set the webhook reciver
- set the recurent type 
- set the schedule for the start and end for the action rule
- set the phone number
- set the alert rule template for sentinel



-----------------------------------------------------------
## Terraform documentation 

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |


### Resources

| Name | Type |
|------|------|
| [azurerm_eventhub.eventhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_namespace.eventhub_namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_log_analytics_linked_storage_account.linked_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_linked_storage_account) | resource |
| [azurerm_log_analytics_solution.log_analytics_solution](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_action_group.monitor_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_action_rule_action_group.action_rule_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_rule_action_group) | resource |
| [azurerm_monitor_activity_log_alert.monitor_activity_log_alert_nsg_cu](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |
| [azurerm_monitor_activity_log_alert.monitor_activity_log_alert_nsg_d](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |
| [azurerm_monitor_log_profile.monitor_log_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_log_profile) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_eventhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_iothub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.monitor_metric_alert_storage_acc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |
| [azurerm_resource_group.iot_monitoring](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

### Inputs

| Name | Description | Type | Default | Should Default be changed? |
|------|-------------|------|---------|:--------:|
| <a name="input_api_managment_id"></a> [api\_managment\_id](#input\_api\_managment\_id) | n/a | `string` | `""` | no |
| <a name="input_app_service_id"></a> [app\_service\_id](#input\_app\_service\_id) | n/a | `string` | `""` | no |
| <a name="input_automation_account_name"></a> [automation\_account\_name](#input\_automation\_account\_name) | n/a | `string` | `"automation-test-account"` | yes |
| <a name="input_automation_runbook_name"></a> [automation\_runbook\_name](#input\_automation\_runbook\_name) | n/a | `string` | `"webhook-test"` | yes |
| <a name="input_automation_runbook_reciver_name"></a> [automation\_runbook\_reciver\_name](#input\_automation\_runbook\_reciver\_name) | n/a | `string` | `"test-reciver"` | yes |
| <a name="input_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#input\_cosmosdb\_account\_id) | n/a | `string` | `""` | no |
| <a name="input_cosmosdb_sql_db_id"></a> [cosmosdb\_sql\_db\_id](#input\_cosmosdb\_sql\_db\_id) | n/a | `string` | `""` | no |
| <a name="input_data_lake_gen2_file_id"></a> [data\_lake\_gen2\_file\_id](#input\_data\_lake\_gen2\_file\_id) | n/a | `string` | `""` | no |
| <a name="input_email_receiver_epost"></a> [email\_receiver\_epost](#input\_email\_receiver\_epost) | n/a | `string` | `"test@test.no"` | yes |
| <a name="input_email_receiver_name"></a> [email\_receiver\_name](#input\_email\_receiver\_name) | n/a | `string` | `"user"` | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | test/stage/prod environment. This is set in .tfvars files | `string` | `""` | no |
| <a name="input_epost"></a> [epost](#input\_epost) | n/a | `list` | <pre>[<br>  "user1@test.no",<br>  "user2@test.no"<br>]</pre> | yes |
| <a name="input_event_hub_receiver_name"></a> [event\_hub\_receiver\_name](#input\_event\_hub\_receiver\_name) | n/a | `string` | `"user"` | yes |
| <a name="input_eventhub_authorization_rule_name"></a> [eventhub\_authorization\_rule\_name](#input\_eventhub\_authorization\_rule\_name) | n/a | `string` | `"eventhub-rule-name"` | yes |
| <a name="input_eventhub_id"></a> [eventhub\_id](#input\_eventhub\_id) | n/a | `string` | `""` | no |
| <a name="input_eventhub_message_retention"></a> [eventhub\_message\_retention](#input\_eventhub\_message\_retention) | n/a | `string` | `"7"` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | n/a | `string` | `"eventhub-monitoring"` | yes |
| <a name="input_eventhub_namespace_capacity"></a> [eventhub\_namespace\_capacity](#input\_eventhub\_namespace\_capacity) | n/a | `number` | `1` | no |
| <a name="input_eventhub_namespace_id"></a> [eventhub\_namespace\_id](#input\_eventhub\_namespace\_id) | n/a | `string` | `""` | no |
| <a name="input_eventhub_namespace_name"></a> [eventhub\_namespace\_name](#input\_eventhub\_namespace\_name) | EventHub | `string` | `"eventhub-namespace-monitoring"` | yes |
| <a name="input_eventhub_namespace_sku"></a> [eventhub\_namespace\_sku](#input\_eventhub\_namespace\_sku) | n/a | `string` | `"Standard"` | no |
| <a name="input_eventhub_partition_count"></a> [eventhub\_partition\_count](#input\_eventhub\_partition\_count) | n/a | `string` | `"2"` | no |
| <a name="input_function_app_id"></a> [function\_app\_id](#input\_function\_app\_id) | n/a | `string` | `""` | no |
| <a name="input_iothub_id"></a> [iothub\_id](#input\_iothub\_id) | n/a | `string` | `""` | no |
| <a name="input_linked_storage_account_data_type"></a> [linked\_storage\_account\_data\_type](#input\_linked\_storage\_account\_data\_type) | n/a | `string` | `"customlogs"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"norwayeast"` | no |
| <a name="input_log_analytics_storage_insights_name"></a> [log\_analytics\_storage\_insights\_name](#input\_log\_analytics\_storage\_insights\_name) | n/a | `string` | `"storage-insights-analytics"` | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Log analytics workspace | `string` | `"log-analytics-workspace"` | yes |
| <a name="input_log_analytics_workspace_retention_days"></a> [log\_analytics\_workspace\_retention\_days](#input\_log\_analytics\_workspace\_retention\_days) | n/a | `number` | `30` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Posible values: Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 | `string` | `"PerGB2018"` | no |
| <a name="input_monitor_action_group_name"></a> [monitor\_action\_group\_name](#input\_monitor\_action\_group\_name) | n/a | `string` | `"iotvehicles-monitor-action-group"` | yes |
| <a name="input_monitor_action_rule_action_group_name"></a> [monitor\_action\_rule\_action\_group\_name](#input\_monitor\_action\_rule\_action\_group\_name) | Action Rule | `string` | `"monitor-actionrule-action-group"` | yes |
| <a name="input_monitor_action_rule_suppression_name"></a> [monitor\_action\_rule\_suppression\_name](#input\_monitor\_action\_rule\_suppression\_name) | n/a | `string` | `"monitor-suppression-test"` | yes |
| <a name="input_monitor_activity_log_alert_name_nsg_cu"></a> [monitor\_activity\_log\_alert\_name\_nsg\_cu](#input\_monitor\_activity\_log\_alert\_name\_nsg\_cu) | n/a | `string` | `"iot-nsg-create"` | yes |
| <a name="input_monitor_activity_log_alert_name_nsg_d"></a> [monitor\_activity\_log\_alert\_name\_nsg\_d](#input\_monitor\_activity\_log\_alert\_name\_nsg\_d) | n/a | `string` | `"iot-nsg-delete"` | yes |
| <a name="input_monitor_autoscale_setting_example_name"></a> [monitor\_autoscale\_setting\_example\_name](#input\_monitor\_autoscale\_setting\_example\_name) | n/a | `string` | `"auto-scaleing-test"` | yes |
| <a name="input_monitor_log_profile_categories"></a> [monitor\_log\_profile\_categories](#input\_monitor\_log\_profile\_categories) | n/a | `list(string)` | <pre>[<br>  "Action",<br>  "Delete",<br>  "Write"<br>]</pre> | no |
| <a name="input_monitor_log_profile_locations"></a> [monitor\_log\_profile\_locations](#input\_monitor\_log\_profile\_locations) | n/a | `list(string)` | <pre>[<br>  "norwayeast",<br>  "norwaywest"<br>]</pre> | no |
| <a name="input_monitor_log_profile_name"></a> [monitor\_log\_profile\_name](#input\_monitor\_log\_profile\_name) | Log Profile | `string` | `"monitor-log-profile"` | yes |
| <a name="input_monitor_metric_alert_name_as"></a> [monitor\_metric\_alert\_name\_as](#input\_monitor\_metric\_alert\_name\_as) | n/a | `string` | `"metric-alert-app-service"` | yes |
| <a name="input_monitor_metric_alert_name_eh"></a> [monitor\_metric\_alert\_name\_eh](#input\_monitor\_metric\_alert\_name\_eh) | n/a | `string` | `"metric-alert-eventhub"` | nyes|
| <a name="input_monitor_metric_alert_name_iot"></a> [monitor\_metric\_alert\_name\_iot](#input\_monitor\_metric\_alert\_name\_iot) | n/a | `string` | `"metric-alert-iot"` | yes |
| <a name="input_monitor_metric_alert_name_sa"></a> [monitor\_metric\_alert\_name\_sa](#input\_monitor\_metric\_alert\_name\_sa) | n/a | `string` | `"metric-alert-storage-account"` | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"iot-monitoring-resource-group"` | yes |
| <a name="input_security_center_automation_name"></a> [security\_center\_automation\_name](#input\_security\_center\_automation\_name) | n/a | `string` | `"security-center-automation"` | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | n/a | `string` | `""` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | #### | `string` | `"monitorstorageaccount55"` | yes |
| <a name="input_stream_analytics_job_id"></a> [stream\_analytics\_job\_id](#input\_stream\_analytics\_job\_id) | n/a | `string` | `""` | no |
| <a name="input_webhook_receiver_name"></a> [webhook\_receiver\_name](#input\_webhook\_receiver\_name) | n/a | `string` | `"webhook-receiver"` | yes |
| <a name="input_webhook_receiver_uri"></a> [webhook\_receiver\_uri](#input\_webhook\_receiver\_uri) | n/a | `string` | `"https://example_webhook.com/123abc"` | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_analytic_workspace_id"></a> [log\_analytic\_workspace\_id](#output\_log\_analytic\_workspace\_id) | n/a |
| <a name="output_log_analytics_solution_id"></a> [log\_analytics\_solution\_id](#output\_log\_analytics\_solution\_id) | n/a |
| <a name="output_log_analytics_solution_workspace_resource_id"></a> [log\_analytics\_solution\_workspace\_resource\_id](#output\_log\_analytics\_solution\_workspace\_resource\_id) | n/a |




-------------------------------------


https://docs.microsoft.com/en-us/azure/iot-central/core/howto-export-data?tabs=event-hubs%2Cjavascript%2Cconnection-string#4-add-destinations

https://github.com/cbchalmers/Azure-Monitor-Alert-Rules/blob/2e2a0fcb825a625802c28f9b198fd34781db03c1/resources_monitor_activity_log_alert.tf

https://github.com/cbchalmers/Azure-Monitor-Alert-Rules/blob/2e2a0fcb825a625802c28f9b198fd34781db03c1/resources_monitor_activity_log_alert.tf#L4