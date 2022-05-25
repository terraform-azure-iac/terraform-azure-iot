variable "environment" {
    type          = string
    default       = ""
    description   = "test/stage/prod environment. This is set in .tfvars files"
}

variable "location" {
    type    = string
    default = "norwayeast"
}

variable "resource_group_name" {
    type    = string
    default = "iot-monitoring-resource-group"
}



#EventHub
variable "eventhub_namespace_name" {
    type    = string
    default = "eventhub-namespace-monitoring"
}

variable "eventhub_namespace_sku" {
    type    = string
    default = "Standard"
}

variable "eventhub_namespace_capacity" {
    type    = number
    default = 1
}

variable "eventhub_name" {
    type    = string
    default = "eventhub-monitoring"
}

variable "eventhub_partition_count" {
    type    = string
    default = "2"
}

variable "eventhub_message_retention" {
    type    = string
    default = "7"
}



#####
variable "storage_account_name" {
    type      = string
    default   = "monitorstorageaccount55"
}

variable "monitor_action_group_name" {
    type      = string 
    default   = "iotvehicles-monitor-action-group"
}

variable "webhook_receiver_name" {
    type      = string
    default   = "webhook-receiver"
}

variable "webhook_receiver_uri" {
    type      = string
    default   = "https://example_webhook.com/123abc"
}

variable "email_receiver_name" {
    type        = string
    default     = "user"
}

variable "email_receiver_epost" {
    type        = string 
    default     = "test@test.no"
}

variable "event_hub_receiver_name" {
    type        = string 
    default     = "user"
}

#variable "event_hub_id_subscription" {}

variable "monitor_activity_log_alert_name_nsg_d" {
    type      = string 
    default   = "iot-nsg-delete"
}

variable "monitor_activity_log_alert_name_nsg_cu" {
    type      = string 
    default   = "iot-nsg-create"
}


variable "monitor_action_rule_suppression_name" {
    type      = string
    default   = "monitor-suppression-test"
}

variable "monitor_autoscale_setting_example_name" {
    type      = string 
    default   = "auto-scaleing-test"
}

variable "epost" {
    type = list
    default = [
        "user1@test.no",
        "user2@test.no"
    ]
    
}

#variable "eventhub_namespace_name" {
#    type      = string
#    default   = "eventhub-logprofile"
#}

variable "monitor_metric_alert_name_iot" {
    type      = string
    default   = "metric-alert-iot"
}

variable "monitor_metric_alert_name_sa" {
    type      = string
    default   = "metric-alert-storage-account"
}

variable "monitor_metric_alert_name_eh" {
    type      = string
    default   = "metric-alert-eventhub"
}

variable "monitor_metric_alert_name_as" {
    type      = string
    default   = "metric-alert-app-service"
}


variable "automation_account_name" {
    type     = string
    default  = "automation-test-account"
}

variable "automation_runbook_name" {
    type      = string
    default   = "webhook-test"
}

variable "automation_runbook_reciver_name" {
    type      = string
    default   = "test-reciver"
}

#variable "log_analytics_workspace_name" {
#    type      = string
#    default   = "log-analytics-workspace"
#}

variable "log_analytics_storage_insights_name" {
    type      = string
    default   = "storage-insights-analytics"
}

#variable "eventhub_name" {
#    type      = string
#    default   = "testeventhub"
#}

variable "eventhub_authorization_rule_name" {
    type      = string
    default   = "eventhub-rule-name"
}

variable "security_center_automation_name" {
    type      = string
    default   = "security-center-automation"
}

#Action Rule
variable "monitor_action_rule_action_group_name" {
    type = string
    default = "monitor-actionrule-action-group"
}

#Log Profile
variable "monitor_log_profile_name" {
    type    = string
    default = "monitor-log-profile"
}

variable "monitor_log_profile_categories" {
    type    = list(string)
    default = ["Action", "Delete", "Write"]
}

variable "monitor_log_profile_locations" {
    type    = list(string)
    default = [ "norwayeast", "norwaywest" ]
}

#Log analytics workspace
variable "log_analytics_workspace_name" {
    type    = string
    default = "log-analytics-workspace"
}

variable "log_analytics_workspace_sku" {
    type    = string
    default = "PerGB2018"
    description = "Posible values: Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018"
}

variable "log_analytics_workspace_retention_days" {
    type    = number
    default = 30
}

variable "linked_storage_account_data_type" {
    type        = string
    default     = "customlogs"
}


#Variables from module iot
#variable "iotcentral_application_id" {
#    type        = string
#    default = ""
#}

variable "iothub_id" {
    type    = string
    default = ""
}

variable "eventhub_id" {
    type    = string
    default = ""
}

variable "eventhub_namespace_id" {
    type    = string
    default = ""
}

variable "stream_analytics_job_id" {
    type    = string
    default = ""
}

variable "storage_account_id" {
    type    = string
    default = ""
}

variable "function_app_id" {
    type    = string
    default = ""
}

variable "cosmosdb_account_id" {
    type    = string
    default = ""
}

variable "cosmosdb_sql_db_id" {
    type    = string
    default = ""
}

variable "data_lake_gen2_file_id" {
    type    = string
    default = ""
}

variable "api_managment_id" {
    type    = string
    default = ""
}

#variable "notification_hub_id" {
#    type       = string
#    default    = ""
#}

variable "app_service_id" {
    type    = string
    default = ""
}