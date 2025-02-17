# création d'un groupe de sécurité
resource "azuread_group" "students_class" {
  display_name     = var.class_name
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

# création des environnements des étudiants
module "student_env" {
  count  = var.nb_students
  source = "./modules/student_env"

  class_name      = var.class_name
  increment       = count.index
  group_object_id = azuread_group.students_class.object_id
  students_password = var.students_password
  tenant_domain   = var.tenant_domain
}
