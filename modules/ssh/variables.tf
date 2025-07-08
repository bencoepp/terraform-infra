variable "seminar" {
    description = "Seminar name for SSH configuration"
    type        = string
}

variable "participant" {
    description = "Participant name for SSH configuration"
    type        = string
}

variable "path" {
    description = "Path to store SSH keys"
    type        = string
    default     = "/home/bencoepp/schulung"
}