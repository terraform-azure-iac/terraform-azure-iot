resource "azurerm_resource_group" "iot_monitoring" {
    name        = "${var.resource_group_name}-${var.environment}"
    location    = var.location
}

data "azurerm_subscription" "current" {
#data.azurerm_subscription.current.subscription_id
}

#Event Hubs
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
    name                 = var.eventhub_namespace_name
    resource_group_name  = azurerm_resource_group.iot_monitoring.name
    location             = var.location
    sku                  = var.eventhub_namespace_sku
    capacity             = var.eventhub_namespace_capacity
}

resource "azurerm_eventhub" "eventhub" {
    name                = var.eventhub_name
    namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    partition_count     = var.eventhub_partition_count
    message_retention   = var.eventhub_message_retention
}

#Monitor Action Group
resource "azurerm_monitor_action_group" "monitor_action_group" {
    name                = var.monitor_action_group_name
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    short_name          = "IoT-action"

    webhook_receiver {
        name        = var.webhook_receiver_name
        service_uri = var.webhook_receiver_uri
    }
    
    email_receiver {
        name          = var.email_receiver_name
        email_address = var.email_receiver_epost
    }

    /*event_hub_receiver {
        name                    = var.event_hub_receiver_name
        event_hub_id            = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/rg-eventhub/providers/Microsoft.EventHub/namespaces/eventhub-namespace-bachelor-2022/eventhubs/event-hub"
        use_common_alert_schema = false
    } 

    azure_function_receiver {
        name                     =
        function_app_resoruce_id =
        function_name            =
        http_trigger_url         =
    }
  */
}


#Metric Alert
/*
To find the right criteria for the monitoring use the link under and/or go in to Azure GUI and to Monitor - Metric and there you can se witch metrics to use
https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/metrics-supported#microsoftnotificationhubsnamespacesnotificationhubs

*/
resource "azurerm_monitor_metric_alert" "monitor_metric_alert_iothub" {
    name                = var.monitor_metric_alert_name_iot
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    scopes              = [ var.iothub_id ] 
    #, var.eventhub_id, var.storage_account_id, var.app_service_id ]
    #var.iothub_id, var.eventhub_id, var.stream_analytics_job_id, var.storage_account_id, var.function_app_id, var.cosmosdb_account_id, var.cosmosdb_sql_db_id, var.api_managment_id, var.app_service_id
    #var.data_lake_gen2_file_id, 
    description         = "Monitoring of resources in the IoT Module"

    /*criteria {
        metric_namespace  = 
        metric_name       =
        aggregation       =
        operator          =
        threshold         =
    }
    */

    criteria {
        metric_namespace  = "Microsoft.Devices/IotHubs"
        metric_name       = "jobs.failed"
        aggregation       = "Total"
        operator          = "GreaterThan"
        threshold         = 10
    }
    
    criteria {
        metric_namespace  = "Microsoft.Devices/IotHubs"
        metric_name       = "connecteddevicecount"
        aggregation       = "Average"
        operator          = "GreaterThan"
        threshold         = 2
    }

    criteria {
        metric_namespace  = "Microsoft.Devices/IotHubs"
        metric_name       = "totaldevicecount"
        aggregation       = "Average"
        operator          = "GreaterThan"
        threshold         = 2
    }

    criteria {
        metric_namespace  = "Microsoft.Devices/IotHubs"
        metric_name       = "connecteddevicecount"
        aggregation       = "Average"
        operator          = "LessThan"
        threshold         = 2
    }

    criteria {
        metric_namespace  = "Microsoft.Devices/IotHubs"
        metric_name       = "totaldevicecount"
        aggregation       = "Average"
        operator          = "LessThan"
        threshold         = 2
    }

    
    
    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}

resource "azurerm_monitor_metric_alert" "monitor_metric_alert_eventhub" {
    name                = var.monitor_metric_alert_name_eh
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    scopes              = [ var.eventhub_namespace_id ]
    #var.iothub_id, var.eventhub_id, var.stream_analytics_job_id, var.storage_account_id, var.function_app_id, var.cosmosdb_account_id, var.cosmosdb_sql_db_id, var.api_managment_id, var.app_service_id
    #var.data_lake_gen2_file_id, 
    description         = "Monitoring of resources in the IoT Module"

    /*criteria {
        metric_namespace  = 
        metric_name       =
        aggregation       =
        operator          =
        threshold         =
    }
    */


    criteria {
        metric_namespace  = "Microsoft.eventhub/namespaces"
        metric_name       = "ServerErrors"
        aggregation       = "Total"
        operator          = "GreaterThan"
        threshold         = 1
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}

resource "azurerm_monitor_metric_alert" "monitor_metric_alert_storage_acc" {
    name                = var.monitor_metric_alert_name_sa
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    scopes              = [ var.storage_account_id ]
    #var.iothub_id, var.eventhub_id, var.stream_analytics_job_id, var.storage_account_id, var.function_app_id, var.cosmosdb_account_id, var.cosmosdb_sql_db_id, var.api_managment_id, var.app_service_id
    #var.data_lake_gen2_file_id, 
    description         = "Monitoring of resources in the IoT Module"


    criteria {
        metric_namespace    = "Microsoft.Storage/storageAccounts"
        metric_name         = "Transactions"
        aggregation         = "Total"
        operator            = "GreaterThan"
        threshold           =  50 #En verdi som er unormalt fra gjennomsnittet
    }

    criteria {
        metric_namespace  = "Microsoft.Storage/storageAccounts"
        metric_name       = "Availability"
        aggregation       = "Average"
        operator          = "LessThan"
        threshold         = 90
    }



    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}

resource "azurerm_monitor_metric_alert" "monitor_metric_alert_app" {
    name                = var.monitor_metric_alert_name_as
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    scopes              = [ var.app_service_id ]
    #var.iothub_id, var.eventhub_id, var.stream_analytics_job_id, var.storage_account_id, var.function_app_id, var.cosmosdb_account_id, var.cosmosdb_sql_db_id, var.api_managment_id, var.app_service_id
    #var.data_lake_gen2_file_id, 
    description         = "Monitoring of resources in the IoT Module"

    /*criteria {
        metric_namespace  = 
        metric_name       =
        aggregation       =
        operator          =
        threshold         =
    }
    */

    criteria {
        metric_namespace  = "Microsoft.Web/sites"
        metric_name       = "HealthCheckStatus"
        aggregation       = "Average"
        operator          = "GreaterThan"
        threshold         = 5
    }
    
    criteria {
        metric_namespace  = "Microsoft.Web/sites"
        metric_name       = "AverageResponseTime"
        aggregation       = "Average"
        operator          = "GreaterThan"
        threshold         = 15
    }
    
    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}



#Action Rule
resource "azurerm_monitor_action_rule_action_group" "action_rule_action_group" {
    name                = var.monitor_action_rule_action_group_name
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    action_group_id     = azurerm_monitor_action_group.monitor_action_group.id

    scope {
        type = "Resource"
        resource_ids = [ var.eventhub_id, var.stream_analytics_job_id, var.storage_account_id, var.function_app_id, var.cosmosdb_account_id, var.cosmosdb_sql_db_id, var.api_managment_id, var.app_service_id, var.iothub_id ]
    }

    condition {
        monitor_service {
            operator = "Equals"
            values = ["ActivityLog Security" ]
        }
    }
}

#Activity log alert
resource "azurerm_monitor_activity_log_alert" "monitor_activity_log_alert_nsg_cu" {
    name                  = var.monitor_activity_log_alert_name_nsg_cu
    resource_group_name   = azurerm_resource_group.iot_monitoring.name
    scopes                = [data.azurerm_subscription.current.id]
    description           = "For monitoring creation and updates for Security Groups"

    criteria {
        operation_name    = "Microsoft.Network/networkSecurityGroups/write"
        category          = "Security"
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}

resource "azurerm_monitor_activity_log_alert" "monitor_activity_log_alert_nsg_d" {
    name                  = var.monitor_activity_log_alert_name_nsg_d
    resource_group_name   = azurerm_resource_group.iot_monitoring.name
    scopes                = [data.azurerm_subscription.current.id]
    description           = "For monitoring deletion of Network Security Groups"

    criteria {
        operation_name    = "Microsoft.Network/networkSecurityGroups/delete"
        category          = "Security"
    }

    action {
        action_group_id = azurerm_monitor_action_group.monitor_action_group.id
    }
}


#Log profile
resource "azurerm_monitor_log_profile" "monitor_log_profile" {
    name                = var.monitor_log_profile_name
    categories          = var.monitor_log_profile_categories
    locations           = var.monitor_log_profile_locations
    servicebus_rule_id  ="${azurerm_eventhub_namespace.eventhub_namespace.id}/authorizationrules/RootManageSharedAccessKey"
    
    retention_policy {
        enabled = true
        days    = 7
    } 

}

#Log analytics workspace
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
    name                = var.log_analytics_workspace_name
    resource_group_name = azurerm_resource_group.iot_monitoring.name
    location            = var.location
    sku                 = var.log_analytics_workspace_sku
    retention_in_days   = var.log_analytics_workspace_retention_days
}

resource "azurerm_log_analytics_solution" "log_analytics_solution" {
    solution_name           = "SecurityInsights"
    location                = var.location 
    resource_group_name     = azurerm_resource_group.iot_monitoring.name 
    workspace_resource_id   = azurerm_log_analytics_workspace.log_analytics_workspace.id 
    workspace_name          = azurerm_log_analytics_workspace.log_analytics_workspace.name

    plan {
        publisher   = "Microsoft"
        product     = "OMSGallery/SecurityInsights"
    }
}


resource "azurerm_log_analytics_linked_storage_account" "linked_storage_account" {
    data_source_type        = var.linked_storage_account_data_type
    resource_group_name     = azurerm_resource_group.iot_monitoring.name
    workspace_resource_id   = azurerm_log_analytics_workspace.log_analytics_workspace.id
    storage_account_ids     = [ var.storage_account_id ] //import av storage account fra iot
}

