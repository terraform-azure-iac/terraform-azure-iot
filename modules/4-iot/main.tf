
resource "azurerm_resource_group" "iot" {
    name        = "${var.resource_group_name}-${var.environment}"
    location    = var.location
}

#IoT Central
#Not available in Norway
/*
resource "azurerm_iotcentral_application" "iot-central" {
    name                  = var.iotcentral_application_name
    resource_group_name   = azurerm_resource_group.iot.name
    location              = "northeurope"
    sub_domain            = var.iotcentral_application_subdomain
    sku                   = var.iotcentral_application_sku
    
    tags                  =  {
        environment = var.environment
    }
}
*/

#IotHub
resource "azurerm_iothub" "iothub" {
    name                            = var.iothub_name
    resource_group_name             = azurerm_resource_group.iot.name
    location                        = var.location
    
    sku {
        name        = var.iothub_sku_name
        capacity    = var.iothub_sku_capacity
    }
    
    endpoint {
        type                = "AzureIotHub.EventHub"
        name                = "iothub-endpoint"
        authentication_type = "keyBased"
        connection_string   = azurerm_eventhub_authorization_rule.eventhub_auth_rule.primary_connection_string
    }
    
    identity {
        type            = "SystemAssigned"
    }
}


#Event Hubs
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
    name                 = var.eventhub_namespace_name
    resource_group_name  = azurerm_resource_group.iot.name
    location             = var.location
    sku                  = var.eventhub_namespace_sku
    capacity             = var.eventhub_namespace_capacity
}

resource "azurerm_eventhub" "eventhub" {
    name                = var.eventhub_name
    namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
    resource_group_name = azurerm_resource_group.iot.name
    partition_count     = var.eventhub_partition_count
    message_retention   = var.eventhub_message_retention
}

resource "azurerm_eventhub_authorization_rule" "eventhub_auth_rule" {
    name                = var.eventhub_auth_rule_name
    namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
    eventhub_name       = azurerm_eventhub.eventhub.name
    resource_group_name = azurerm_resource_group.iot.name
    listen              = true
    send                = true
    manage              = false
}

resource "azurerm_eventhub_consumer_group" "eventhub_consumer_group" {
    name                = var.eventhub_auth_rule_name
    namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
    eventhub_name       = azurerm_eventhub.eventhub.name
    resource_group_name = azurerm_resource_group.iot.name 
    user_metadata       = var.eventhub_consumer_group_user_data 
}

#Stream Analytics
resource "azurerm_stream_analytics_job" "stream_analytics_job" {
    name                 = var.stream_analytics_job_name
    resource_group_name  = azurerm_resource_group.iot.name
    location             = var.location
    compatibility_level  = var.stream_analytics_job_compatability_level
    streaming_units      = var.stream_analytics_job_streaming_units
    transformation_query = <<QUERY
        SELECT *
        INTO []
        FROM []
    QUERY
}


#Function App
resource "random_integer" "int" {
    min = 1
    max = 50000
}

resource "azurerm_storage_account" "storage_account" {
    name                        = "${var.storage_account_name}${random_integer.int.result}"
    resource_group_name         = azurerm_resource_group.iot.name
    location                    = var.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}

resource "azurerm_app_service_plan" "app_service_plan_function" {
    name                = var.app_service_plan_name_function
    location            = var.location
    resource_group_name = azurerm_resource_group.iot.name
    kind                = "FunctionApp"
    zone_redundant      = false
    sku {
        tier = "Standard"
        size = "S1"
    }
}

#
resource "azurerm_function_app" "function_app" {
    name                       = var.function_app_name
    location                   = var.location
    resource_group_name        = azurerm_resource_group.iot.name
    app_service_plan_id        = azurerm_app_service_plan.app_service_plan_function.id
    storage_account_name       = azurerm_storage_account.storage_account.name
    storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
    https_only                  = true

    /* connection_string {
        name    = ""
        type    = ""
        value   = 
    } */
}



#CosmosDB
resource "azurerm_cosmosdb_account" "cosmosdb_account" {
    name                = var.cosmosdb_account_name
    location            = var.location 
    resource_group_name = azurerm_resource_group.iot.name
    offer_type          = "Standard"
    enable_free_tier    = true

    geo_location {
        location          = var.location
        failover_priority = 0
    }

    consistency_policy {
        consistency_level       = "Session"
    }

    backup {
        type                = "Periodic"
        interval_in_minutes = 180
        retention_in_hours  = 24
        storage_redundancy  = "Local"  
    }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_sql_database" {
    name                = var.cosmosdb_account_name
    resource_group_name = azurerm_resource_group.iot.name
    account_name        = azurerm_cosmosdb_account.cosmosdb_account.name
    throughput          = var.cosmosdb_sql_db_throughput
}

#Data Lake 
resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake_gen2_file" {
    name               = var.data_lake_gen2_file_name
    storage_account_id = azurerm_storage_account.storage_account.id
}

#API Managment Service
resource "azurerm_api_management" "api_managment" {
    name                = "${var.api_managment_name}-${random_integer.int.result}"
    location            = var.location
    resource_group_name = azurerm_resource_group.iot.name
    publisher_name      = var.api_managment_publisher_name
    publisher_email     = var.api_managment_publisher_email
    sku_name            = var.api_managment_sku
}


#Notification Hubs
# Resource dont exist in Norway
/*
resource "azurerm_notification_hub_namespace" "notification_hub_namespace" {
    name                = var.notification_hub_namespace_name
    resource_group_name = azurerm_resource_group.iot.name
    location            = "northeurope"
    namespace_type      = "NotificationHub"
    sku_name            = "Basic"
}

resource "azurerm_notification_hub" "notification_hub" {
    name                = var.notification_hub_name
    namespace_name      = azurerm_notification_hub_namespace.notification_hub_namespace.name
    resource_group_name = azurerm_resource_group.iot.name
    location            = "northeurope"
}
*/

#resource "azurerm_notification_hub_authorization_rule" "" {}

#App Service
resource "azurerm_app_service_plan" "app_service_plan_gui" {
    name                = var.app_service_plan_name
    location            = var.location
    resource_group_name = azurerm_resource_group.iot.name
    
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "app_service" {
    name                 = var.app_service_name
    location             = var.location 
    resource_group_name  = azurerm_resource_group.iot.name
    app_service_plan_id  = azurerm_app_service_plan.app_service_plan_gui.id
    https_only                  = true

    site_config {
        dotnet_framework_version = "v6.0"
        #scm_type                 = "GitHub"
    }   
}


#Power BI
resource "azurerm_powerbi_embedded" "powerbi_" {
    name                    = var.powerbi_embedded_name
    location                = var.location
    resource_group_name     = azurerm_resource_group.iot.name
    sku_name                = "A1"
    administrators          = var.powerbi_embedded_admins
}
