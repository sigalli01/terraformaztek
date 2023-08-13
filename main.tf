terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
     features {}
}



resource "azurerm_resource_group" "main" {
  name     = "myTFResourceGroup"
  location = "westeurope"
}

resource "azurerm_service_plan" "example" {
  name     = "TFResource"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type = "Linux"
  sku_name = "P1v2"
  asp_sku_tier = "PremiumV3"
  asp_sku_size = "P3v3

}


  resource "azurerm_linux_web_app" "example" {
    name                = "examplepy"
    location            = azurerm_resource_group.main.location
    resource_group_name = azurerm_resource_group.main.name
    service_plan_id = azurerm_service_plan.example.id


site_config {}
}    