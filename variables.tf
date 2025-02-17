variable "nb_students" {
  description = "Number of students to create"
  type        = number
  default     = 15
}

variable "class_name" {
  description = "Name of the class"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "France Central"
}

variable "students_password" {
  description = "Password for the students"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_domain" {
  description = "Tenant domain"
  type        = string
}
