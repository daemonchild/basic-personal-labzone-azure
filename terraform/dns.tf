
// Project: Basic Personal Cloud Labzone
// Author:  Daemonchild
// Purpose: Build a basic environment for running other things

#    __ _ _____   _ _ __ ___ 
#   / _` |_  / | | | '__/ _ \
#  | (_| |/ /| |_| | | |  __/
#   \__,_/___|\__,_|_|  \___|   Version
 
                                                 
// DNS Zone Resources

// Note: The user will need to configure the nameservers for their 

// Define some constants
locals {
  
    dns_ttl_short   = 1800
    dns_ttl_long    = 7200
    dns_leet_ip     = "1.3.3.7"
    dns_limbo_ip    = "0.0.0.0"

}

// DNS Base Zone - Expecting to use subdomains for projects
resource "azurerm_dns_zone" "dns_base_zone" {
    name                = var.dnsdomain
    resource_group_name = local.resgrp
    tags                = local.tags
    depends_on = [
        azurerm_resource_group.resgrp,
    ]
}

// Default for domain points nowhere
resource "azurerm_dns_a_record" "dns_a_record_default" {
    name                = "@"
    records             = [ local.dns_limbo_ip ]
    zone_name           = azurerm_dns_zone.dns_base_zone.name
    resource_group_name = local.resgrp
    ttl                 = local.dns_ttl_short
    depends_on = [
        azurerm_resource_group.resgrp,
    ]
}

// Adds an A record for the project name, as an example
resource "azurerm_dns_a_record" "dns_a_record_project" {
    name                = "${var.project}"
    records             = [ local.dns_leet_ip ]
    zone_name           = azurerm_dns_zone.dns_base_zone.name
    resource_group_name = local.resgrp
    ttl                 = local.dns_ttl_short
    depends_on = [
        azurerm_resource_group.resgrp,
    ]
}

// End of file