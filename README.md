# case-iot-vehicles
Use of IoT to monitor vehicles and similar resources 


## Info / intro

This repository sets up an infrastructure able to receive, analyze and present data from IoT devices. 

![iot-vehicles-resources-norway.png](/img/iot-vehicles-resources-norway.png)

📦case-iot-vehicles  <br/>
┣ 📂 [img/](img/)  <br/>
┃ ┗ 📜 [iot-vehicles.png](img/iot-vehicles.png)  <br/>
┣ 📂 [modules/](modules)  <br/>
┃ ┣ 📂 [1-monitoring/](modules/1-monitoring)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/1-monitoring/main.tf)  <br/>
┃ ┃ ┣ 📜 [outputs.tf](modules/1-monitoring/outputs.tf)  <br/>
┃ ┃ ┣ 📜 [readme.md](modules/1-monitoring/readme.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/1-monitoring/variables.tf)  <br/>
┃ ┣ 📂 [2-budget-monitoring/](modules/2-budget-monitoring)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/2-budget-monitoring/main.tf)  <br/>
┃ ┃ ┣ 📜 [outputs.tf](modules/2-budget-monitoring/outputs.tf)  <br/>
┃ ┃ ┣ 📜 [readme.md](modules/2-budget-monitoring/readme.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/2-budget-monitoring/variables.tf)  <br/>
┃ ┣ 📂 [3-security/](modules/3-security)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/3-security/main.tf)  <br/>
┃ ┃ ┣ 📜 [outputs.tf](modules/3-security/outputs.tf)  <br/>
┃ ┃ ┣ 📜 [readme.md](modules/3-security/readme.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/3-security/variables.tf)  <br/>
┃ ┗ 📂 [4-iot/](modules/4-iot)  <br/>
┃ ┃ ┣ 📜 [main.tf](modules/4-iot/main.tf)  <br/>
┃ ┃ ┣ 📜 [outputs.tf](modules/4-iot/outputs.tf)  <br/>
┃ ┃ ┣ 📜 [readme.md](modules/4-iot/readme.md)  <br/>
┃ ┃ ┗ 📜 [variables.tf](modules/4-iot/variables.tf)  <br/>
┣ 📜 [.gitignore](.gitignore)  <br/>
┣ 📜 [.terraform.lock.hcl](.terraform.lock.hcl)  <br/>
┣ 📜 [backend.tf](backend.tf)  <br/>
┣ 📜 [backend_override.tf](backend_override.tf)  <br/>
┣ 📜 [main.tf](main.tf)  <br/>
┣ 📜 [outputs.tf](outputs.tf)  <br/>
┣ 📜 [README.md](README.md)  <br/>
┣ 📜 [terraform.tfstate](terraform.tfstate)  <br/>
┣ 📜 [terraform.tfstate.backup](terraform.tfstate.backup)  <br/>
┗ 📜 [variables.tf](variables.tf)  <br/>



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

