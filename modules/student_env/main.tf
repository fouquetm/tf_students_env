# création de comptes
resource "azuread_user" "students" {
  user_principal_name = "student${var.increment}@${var.tenant_domain}"
  display_name        = "student${var.increment}"
  password            = var.students_password
}

# affectuer des droits sur les groupes de ressources pour chaque user
resource "azuread_group_member" "students_group_members" {
  group_object_id  = var.group_object_id
  member_object_id = azuread_user.students.object_id
}

# créer un groupe de ressource par compte utilisateur
resource "azurerm_resource_group" "rg_students" {
  name     = "rg-${var.class_name}-student${var.increment}"
  location = var.location
}

# affecter des droits sur les groupes de ressources pour chaque user
resource "azurerm_role_assignment" "students_role_assignment" {
  scope                = azurerm_resource_group.rg_students.id
  role_definition_name = "Owner"
  principal_id         = azuread_user.students.object_id
}

# créer un compte de stockage par compte utilisateur
resource "random_string" "main" {
  length = 18
  special = false
  upper = false  
}

resource "azurerm_storage_account" "main" {
  name                     = "st${random_string.main.result}"
  resource_group_name      = azurerm_resource_group.rg_students.name
  location                 = azurerm_resource_group.rg_students.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstates" {
  name                  = "tfstates"
  storage_account_id    = azurerm_storage_account.main.id
  container_access_type = "private"
}

