variable "participants" {
  description = "Informationen zu den Teilnehmern"
  type = list(object({
    name        = string
    email       = string
    instances   = number
    own_vpc     = bool
    k8s_cluster = bool
  }))
}

variable "seminar_name" {
  description = "Name des Seminars"
  type        = string
  default     = "default-seminar"
}