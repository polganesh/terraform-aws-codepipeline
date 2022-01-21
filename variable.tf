variable "pipeline_type" {
  type        = string
  description = "ci"
  default     = "ci"
  validation {
    condition     = contains(["ci", "cd", "cicd"], var.pipeline_type)
    error_message = "Valid values for var: pipeline_type are ci,cd,cicd."
  }
}

variable "artifact_store" {
  description = "Map to populate the artifact block"
  type        = map(any)
}

variable "role_arn" {
  default = ""
  type    = string
}

variable "stages" {
  type        = list(any)
  description = "This list describes each stage of the build"
}


variable "environment" {
  description = "indicates name of our environment. possible values dev,cit,sit,uat,pprod,prod,n"
  default     = "dev"
}

variable "cost_centre" {
  description = "A part of an organization to which costs may be charged.e.g. finance/it/hr/wholesale/retail/investment etc..."
  default     = "na"
}

variable "app_service" {}

variable "seq_id" {}

#variable "region_id" {
#  default = "euw1"
#}

variable "version_id" {
  default = "001"
}

variable "build_date" {
  default = ""
}


