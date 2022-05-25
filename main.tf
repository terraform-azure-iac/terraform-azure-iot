
module "monitoring" {
  source                    = "./modules/1-monitoring"
  environment               = var.environment 
  
  #iotcentral_application_id = module.iot.iotcentral_application_id
  iothub_id                     = module.iot.iothub_id
  eventhub_id                   = module.iot.eventhub_id
  eventhub_namespace_id         = module.iot.eventhub_namespace_id
  stream_analytics_job_id       = module.iot.stream_analytics_job_id
  storage_account_id            = module.iot.storage_account_id
  function_app_id               = module.iot.function_app_id
  cosmosdb_account_id           = module.iot.cosmosdb_account_id
  cosmosdb_sql_db_id            = module.iot.cosmosdb_sql_db_id
  data_lake_gen2_file_id        = module.iot.data_lake_gen2_file_id
  api_managment_id              = module.iot.api_managment_id
  #notification_hub_id           = module.iot.notification_hub_id
  app_service_id                = module.iot.app_service_id
}


module "budget" {
  source                  = "./modules/2-budget-monitoring"
  environment             = var.environment 
  iot_resource_group_id   = module.iot.resource_group_id
}


module "security" {
  source    = "./modules/3-security"

  log_analytic_workspace_id = module.monitoring.log_analytic_workspace_id

  log_analytics_solution_id = module.monitoring.log_analytics_solution_id

  log_analytics_solution_workspace_resource_id = module.monitoring.log_analytics_solution_workspace_resource_id
}


module "iot" {
  environment = var.environment 
  source      = "./modules/4-iot"
}   
