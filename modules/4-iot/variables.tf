variable "environment" {
    type      = string
    default   = ""
}

variable "location" {
    type    = string
    default = "norwayeast"
}

variable "resource_group_name" {
    type  = string
    default = "IoT-vehicles"
}


#IoT Central
variable "iotcentral_application_name" {
    type    = string
    default = "iot-central-application-ntnu-bachelor-2022"
}

variable "iotcentral_application_subdomain" {
    type    = string
    default = "iot-central-application-subdomain"
}

variable "iotcentral_application_sku" {
    type    = string
    default = "ST1"
}

#IotHub
variable "iothub_name" {
    type    = string
    default = "iot-hub-ntnu-bachelor-2022"
}

variable "iothub_sku_name" {
    type    = string
    default = "B1"  
    #Standard
}

variable "iothub_sku_capacity" {
    type    = string
    default = "1"
}

#Eventhub
variable "eventhub_namespace_name" {
    type    = string
    default = "eventhub-namespace-ntnu-bachelor-2022"
}

variable "eventhub_namespace_sku" {
    type    = string
    default = "Standard"
}

variable "eventhub_namespace_capacity" {
    type    = number
    default = 2
}

variable "eventhub_name" {
    type    = string
    default = "event-hub"
}

variable "eventhub_partition_count" {
    type    = number
    default = 2
}

variable "eventhub_message_retention" {
    type    = number
    default = 7
}

variable "eventhub_auth_rule_name" {
    type    = string
    default = "eventhub-authorization-rule"
}

variable "eventhub_consumer_group_name" {
    type    = string
    default = "eventhub-consumer-group"
}

variable "eventhub_consumer_group_user_data" {
    type        = string
    default     = "some-meta-data"
    description = "Usermetadata is a placeholder to store user-defined string data with maximum length 1024. e.g. it can be used to store descriptive data, such as list of teams and their contact information also user-defined configuration settings can be stored."
}


variable "stream_analytics_job_name" {
    type = string
    default = "stream-analytics-job"
}

variable "stream_analytics_job_compatability_level" {
    type    = string
    default = "1.2"
}

variable "stream_analytics_job_streaming_units" {
    type    = number
    default = 3
}

#Function App
variable "storage_account_name" {
    type    = string
    default = "storacciotvehicel"
}

variable "app_service_plan_name_function" {
    type    = string
    default = "app-service-plan-iot-vehivels"
}

variable "function_app_name" {
    type    = string
    default = "function-app-ntnu-bach-22"
}


#CosmosDB
variable "cosmosdb_account_name" {
    type    = string
    default = "cosmosdb-account-iot-vehicles"
}

variable "cosmosdb_sql_db_throughput" {
    type    = number
    default = 600
}

#Data Lake
variable "data_lake_gen2_file_name" {
    type    = string
    default = "data-lake-filesystem"
}


#API Managment Service
variable "api_managment_name" {
    type    = string
    default = "api-managment"
}

variable "api_managment_publisher_name" {
    type    = string
    default = "secure-and-compliant-iac"
}

variable "api_managment_publisher_email" {
    type    = string
    default = "test@test.com"
}

variable "api_managment_sku" {
    type    = string
    default = "Basic_1"
}

#Notification Hubs
variable "notification_hub_namespace_name" {
    type =  string
    default = "notification-hub-namespace-ntnu-bach-22"
}

variable "notification_hub_namespace_sku" {
    type =  string
    default = "Free"
}

variable "notification_hub_name" {
    type =  string
    default = "notification-hub"
}


#App Service
variable "app_service_plan_name" {
    type =  string
    default = "app-service-plan-user-interface"
}

variable "app_service_name" {
    type =  string
    default = "app-service-user-interface"
}


#Power BI
variable "powerbi_embedded_name" {
    type = string
    default = "powerbiembedded"
}

variable "powerbi_embedded_admins" {
    type = list
    default = ["adminTest@test.no"]
    
}
