# case-iot-vehicles
Use of IoT to monitor vehicles and similar resources 


## Info / intro

This repository sets up an infrastructure able to receive, analyze and present data from IoT devices. 

![iot-vehicles-resources-norway.png](/img/iot-vehicles-resources-norway.png)

ð¦case-iot-vehicles  <br/>
â£ ð [img/](img/)  <br/>
â â ð [iot-vehicles.png](img/iot-vehicles.png)  <br/>
â£ ð [modules/](modules)  <br/>
â â£ ð [1-monitoring/](modules/1-monitoring)  <br/>
â â â£ ð [main.tf](modules/1-monitoring/main.tf)  <br/>
â â â£ ð [outputs.tf](modules/1-monitoring/outputs.tf)  <br/>
â â â£ ð [readme.md](modules/1-monitoring/readme.md)  <br/>
â â â ð [variables.tf](modules/1-monitoring/variables.tf)  <br/>
â â£ ð [2-budget-monitoring/](modules/2-budget-monitoring)  <br/>
â â â£ ð [main.tf](modules/2-budget-monitoring/main.tf)  <br/>
â â â£ ð [outputs.tf](modules/2-budget-monitoring/outputs.tf)  <br/>
â â â£ ð [readme.md](modules/2-budget-monitoring/readme.md)  <br/>
â â â ð [variables.tf](modules/2-budget-monitoring/variables.tf)  <br/>
â â£ ð [3-security/](modules/3-security)  <br/>
â â â£ ð [main.tf](modules/3-security/main.tf)  <br/>
â â â£ ð [outputs.tf](modules/3-security/outputs.tf)  <br/>
â â â£ ð [readme.md](modules/3-security/readme.md)  <br/>
â â â ð [variables.tf](modules/3-security/variables.tf)  <br/>
â â ð [4-iot/](modules/4-iot)  <br/>
â â â£ ð [main.tf](modules/4-iot/main.tf)  <br/>
â â â£ ð [outputs.tf](modules/4-iot/outputs.tf)  <br/>
â â â£ ð [readme.md](modules/4-iot/readme.md)  <br/>
â â â ð [variables.tf](modules/4-iot/variables.tf)  <br/>
â£ ð [.gitignore](.gitignore)  <br/>
â£ ð [.terraform.lock.hcl](.terraform.lock.hcl)  <br/>
â£ ð [backend.tf](backend.tf)  <br/>
â£ ð [backend_override.tf](backend_override.tf)  <br/>
â£ ð [main.tf](main.tf)  <br/>
â£ ð [outputs.tf](outputs.tf)  <br/>
â£ ð [README.md](README.md)  <br/>
â£ ð [terraform.tfstate](terraform.tfstate)  <br/>
â£ ð [terraform.tfstate.backup](terraform.tfstate.backup)  <br/>
â ð [variables.tf](variables.tf)  <br/>



-----------------------------------------------------------
## Terraform documentation 
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.0 |

### Providers

No providers.

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | ./modules/1-monitoring | n/a |
| <a name="module_budget"></a> [budget](#module\_budget) | ./modules/2-budget-monitoring | n/a |
| <a name="module_security"></a> [security](#module\_security) | ./modules/3-security | n/a |
| <a name="module_iot"></a> [iot](#module\_iot) | ./modules/4-iot | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | test/stage/prod environment. This is set in .tfvars files | `string` | `""` | no |

### Outputs

No outputs.

