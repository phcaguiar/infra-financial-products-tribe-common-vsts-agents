terraform {
  backend "azurerm" {
    resource_group_name  = "FinancialProducts-Common-EC2-PRD"
    storage_account_name = "tfprdec2finprodcommonstn"
    container_name       = "tfstatebackend-common"
    key                  = "fp-prd-vsts-aq.tfstate"
  }
}