variable "security_center_contact_email" {
    type      = string
    default   = "test@test.no" 
}

variable "security_center_contact_phone" {
    type      = string
    default   = "+1-555-555-5555" 
}


variable "sentinel_alert_rule_fusion_name" {
    type      = string
    default   = "iot-fusion" 
}

variable "sentinel_alert_machine_learning_name" {
    type      = string
    default   = "iot-sentinel-machinelearning" 
}

variable "sentinel_alert_rule_ms_security_incident_name" {
    type      = string
    default   = "iot-ms-incident" 
}

variable "sentinel_data_connector_azure_security_center_name" {
    type      = string
    default   = "security-center-connector" 
}

variable "sentienl_watchlist_name" {
    type      = string
    default   = "sentinel_watchlist_iot" 
}

variable "sentienl_watchlist_item_name" {
    type      = string
    default   = "0aac6fa5-223e-49cf-9bfd-3554dc9d2b76" 
}


variable "log_analytic_workspace_id" {
    type      = string
    default   = ""
}

variable "log_analytics_solution_id" {
    type      = string
    default   = ""
}

variable "log_analytics_solution_workspace_resource_id" {
    type      = string
    default   = ""
}