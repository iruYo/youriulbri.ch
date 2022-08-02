variable "bucket" {
  type = string
  description = "Bucket name"
}

variable "domain" {
  type = string
  description = "Domain name"
}

variable "region" {
  type = string
  description = "The AWS region website is hosted in."
}

variable "tags" {
    description = "Common tags for personal website"
}

variable "env" {
  type = string
  description = "TBD"
}