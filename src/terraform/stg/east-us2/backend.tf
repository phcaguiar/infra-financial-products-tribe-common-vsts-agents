terraform {
  backend "azurerm" {
    resource_group_name  = "FinancialProducts-Common-EC2-STG"
    storage_account_name = "tfstgfinprodscommonstone"
    container_name       = "tfstatebackend-common"
    key                  = "fp-stg-vsts-aq.tfstate"
  }
}