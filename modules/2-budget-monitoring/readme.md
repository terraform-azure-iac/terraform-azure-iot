# Azure Budget Management


## Info / Intro 
This module sets a budget for the subscription with a threshold (NOK). When threshold is reached, an alert is triggered. An action group contains the recipients and actions to the alert notifications. 



## Configure Module

- Set Email receivers 
- Set Webhook receivers 
- Set amount in NOK for the budget
- Set threshold in % of the budget for when alert is triggered
- Set the time grain for the budget, the period the amount is for (e.g. Monthly)
- Set time period start date and end date, in the format "YYYY-MM-DDT00:00:00Z" for when the budget consumption starts and ends.

-----------------------------------------------------------
## Terraform documentation 

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

### Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_resource_group.consumption_budget_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) | resource |
| [azurerm_consumption_budget_subscription.consumption_budget_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) | resource |
| [azurerm_monitor_action_group.monitor_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_resource_group.budget](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

### Inputs

| Name | Description | Type | Default | Should Default be changed? |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_name"></a> [action\_group\_name](#input\_action\_group\_name) | monitor action group | `string` | `"monitor-action-group"` | yes |
| <a name="input_action_group_short_name"></a> [action\_group\_short\_name](#input\_action\_group\_short\_name) | n/a | `string` | `"budget-mon"` | yes |
| <a name="input_consumption_budget_resource_group_amount"></a> [consumption\_budget\_resource\_group\_amount](#input\_consumption\_budget\_resource\_group\_amount) | n/a | `number` | `10` | yes |
| <a name="input_consumption_budget_resource_group_name"></a> [consumption\_budget\_resource\_group\_name](#input\_consumption\_budget\_resource\_group\_name) | consumption budget resource group | `string` | `"consumption-budget-resource-group"` | yes |
| <a name="input_consumption_budget_resource_group_time_grain"></a> [consumption\_budget\_resource\_group\_time\_grain](#input\_consumption\_budget\_resource\_group\_time\_grain) | n/a | `string` | `"Monthly"` | no |
| <a name="input_consumption_budget_resource_group_time_period"></a> [consumption\_budget\_resource\_group\_time\_period](#input\_consumption\_budget\_resource\_group\_time\_period) | n/a | `list` | <pre>[<br>  "2022-03-01T00:00:00Z",<br>  "2023-01-01T00:00:00Z"<br>]</pre> | yes |
| <a name="input_consumption_budget_subscription_amount"></a> [consumption\_budget\_subscription\_amount](#input\_consumption\_budget\_subscription\_amount) | n/a | `number` | `10` | yes |
| <a name="input_consumption_budget_subscription_name"></a> [consumption\_budget\_subscription\_name](#input\_consumption\_budget\_subscription\_name) | consumption budget subscription | `string` | `"consumption-budget-subscription"` | yes |
| <a name="input_consumption_budget_subscription_time_grain"></a> [consumption\_budget\_subscription\_time\_grain](#input\_consumption\_budget\_subscription\_time\_grain) | n/a | `string` | `"Monthly"` | no |
| <a name="input_consumption_budget_subscription_time_period"></a> [consumption\_budget\_subscription\_time\_period](#input\_consumption\_budget\_subscription\_time\_period) | n/a | `list` | <pre>[<br>  "2022-04-01T00:00:00Z",<br>  "2023-01-01T00:00:00Z"<br>]</pre> | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | test/stage/prod environment. This is set in .tfvars files | `string` | `""` | no |
| <a name="input_iot_resource_group_id"></a> [iot\_resource\_group\_id](#input\_iot\_resource\_group\_id) | ################################# Variables from other modules | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"norwayeast"` | no |
| <a name="input_receiver"></a> [receiver](#input\_receiver) | n/a | <pre>list(object({<br>        name                    = string<br>        email_address           = string<br>        country_code            = string<br>        phone_number            = string<br>        use_common_alert_schema = bool<br>    }))</pre> | <pre>[<br>  {<br>  
  "country_code": "47",<br>    "email_address": "employee1@test.no",<br>    "name": "employee name 1",<br>    "phone_number": "12345678",<br>    "use_common_alert_schema": true<br>  },<br>  {<br>    "country_code": "47",<br>    "email_address": "employee2@test.no",<br>    "name": "Employee Name 2",<br>    "phone_number": "23456789",<br>   
 "use_common_alert_schema": true<br>  }<br>]</pre> | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | `"iot-budget-monitoring"` | yes |
| <a name="input_webhook_receiver_name"></a> [webhook\_receiver\_name](#input\_webhook\_receiver\_name) | n/a | `string` | `"budget-webhook"` | yes |
| <a name="input_webhook_receiver_uri"></a> [webhook\_receiver\_uri](#input\_webhook\_receiver\_uri) | n/a | `string` | `"https://example_webhook.com/123abc"` | yes |

### Outputs

No outputs.


-----------------------------------------------------
### Resources:

- [Azure Cost Management](https://docs.microsoft.com/en-us/azure/cost-management-billing/) lets you manage cost in Azure by setting up a budget. 

- [Azure Budget Alerts](https://docs.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-alerts-monitor-usage-spending) can react when a budget threshold is reached. The budget alert can notify someone, or trigger a workflow.
- [Azure Action Group](https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/action-groups) is a resource where you define who or what becomes the "receiver" when an alert is triggered. The receiver can be people in the form of email, SMS or notification to a communication platform. Alerts can also trigger workflows in Azure such as [automation runbooks](https://docs.microsoft.com/en-us/azure/automation/automation-runbook-types) or [Azure functions](https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview).


### References:

Micorsoft Documenation:
- [Azure Cost Management](https://docs.microsoft.com/en-us/azure/cost-management-billing/) 
- [Azure Budget Alerts](https://docs.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-alerts-monitor-usage-spending) 
- [Azure Action Group](https://docs.microsoft.com/en-us/azure/azure-monitor/alerts/action-groups) 
- [automation runbooks](https://docs.microsoft.com/en-us/azure/automation/automation-runbook-types) 
- [Azure functions](https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview).
-[Use cost alerts to monitor usage and spending](https://docs.microsoft.com/en-us/azure/cost-management-billing/costs/cost-mgt-alerts-monitor-usage-spending)