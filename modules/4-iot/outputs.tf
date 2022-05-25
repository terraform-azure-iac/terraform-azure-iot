output "resource_group_id" {
    value   = azurerm_resource_group.iot.id
}


#output "iotcentral_application_id" {
#    value = azurerm_iotcentral_application.iot_central.id
#}

output "iothub_id" {
    value = azurerm_iothub.iothub.id
}


output "eventhub_id" {
    value = azurerm_eventhub.eventhub.id
}

output "eventhub_namespace_id" {
    value = azurerm_eventhub_namespace.eventhub_namespace.id
}

output "stream_analytics_job_id" {
    value = azurerm_stream_analytics_job.stream_analytics_job.id
}

output "storage_account_id" {
    value = azurerm_storage_account.storage_account.id
}

output "function_app_id" {
    value = azurerm_function_app.function_app.id
}

output "cosmosdb_account_id" {
    value = azurerm_cosmosdb_account.cosmosdb_account.id
}

output "cosmosdb_sql_db_id" {
    value = azurerm_cosmosdb_sql_database.cosmosdb_sql_database.id
}

output "data_lake_gen2_file_id" {
    value = azurerm_storage_data_lake_gen2_filesystem.data_lake_gen2_file.id
}

output "api_managment_id" {
    value = azurerm_api_management.api_managment.id 
}

#output "notification_hub_id" {
#    value = azurerm_notification_hub.notification_hub.id
#}

output "app_service_id" {
    value = azurerm_app_service.app_service.id
}