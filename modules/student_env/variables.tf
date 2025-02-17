variable "class_name" {
  description = "Nom de la classe"
  type        = string
}

variable "location" {
  description = "Localisation des ressources"
  type        = string
  default     = "francecentral"
}

variable "increment" {
  description = "Incrément pour les noms des ressources"
  type        = number
}

variable "group_object_id" {
  description = "Object ID du groupe de sécurité"
  type        = string
}

variable "students_password" {
  description = "Mot de passe pour les étudiants"
  type        = string
  sensitive   = true
}

variable "tenant_domain" {
  description = "Domaine du tenant"
  type        = string
}
