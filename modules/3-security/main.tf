data "azurerm_subscription" "current" {

}


resource "azurerm_security_center_contact" "security_center_contact" {
    email                = var.security_center_contact_email 
    phone                = var.security_center_contact_phone
    alert_notifications  = true
    alerts_to_admins     = true
}

resource "azurerm_security_center_workspace" "name" {
    scope         = "/subscriptions/${data.azurerm_subscription.current.subscription_id}"
    workspace_id  = var.log_analytic_workspace_id
}

resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_sa" {
    tier            = "Standard"
    resource_type   = "StorageAccounts"
}

resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_as" {
    tier            = "Standard"
    resource_type   = "AppServices"
}

resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_ss" {
    tier            = "Standard"
    resource_type   = "SqlServers"
}

resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricing_dns" {
    tier            = "Standard"
    resource_type   = "Dns"
}

resource "azurerm_sentinel_alert_rule_fusion" "sentinel_alert_rule_fusion" {
    name                        = var.sentinel_alert_rule_fusion_name
    log_analytics_workspace_id  = var.log_analytic_workspace_id
    alert_rule_template_guid    = "f71aba3d-28fb-450b-b192-4e76a83015c8"
}

resource "azurerm_sentinel_alert_rule_machine_learning_behavior_analytics" "sentinel_alert_machine_learning" {
    name                        = var.sentinel_alert_machine_learning_name
    log_analytics_workspace_id  = var.log_analytic_workspace_id
    alert_rule_template_guid    = "737a2ce1-70a3-4968-9e90-3e6aca836abf"
}

resource "azurerm_sentinel_alert_rule_ms_security_incident" "sentinel_alert_rule_ms_security_incident" {
    name                        = var.sentinel_alert_rule_ms_security_incident_name
    log_analytics_workspace_id  = var.log_analytics_solution_workspace_resource_id
    product_filter              = "Microsoft Cloud App Security" 
    display_name                = "IoT-rule" 
    severity_filter             = [ "High" ]
}

resource "azurerm_sentinel_data_connector_azure_security_center" "sentinel_data_connector_azure_security_center" {
    name                        = var.sentinel_data_connector_azure_security_center_name
    log_analytics_workspace_id  = var.log_analytics_solution_workspace_resource_id
}

/*
resource "azurerm_sentinel_watchlist" "sentienl_watchlist" {
    name                        = var.sentienl_watchlist_name
    log_analytics_workspace_id  = var.log_analytics_solution_workspace_resource_id 
    display_name                = "iot-watchlist" 
}

resource "azurerm_sentinel_watchlist_item" "sentienl_watchlist_item" {
    name          = var.sentienl_watchlist_item_name
    watchlist_id  = azurerm_sentinel_watchlist.sentienl_watchlist.id
    
    properties  = {
        k1 = "v1"
        k2 = "v2"
    }
}
*/