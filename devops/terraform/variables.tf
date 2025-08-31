variable "resource_group_location" {
  type        = string
  default     = "East Us"
  description = "Azure region for the resource group"
}

variable "resource_group_name" {
  type        = string
  default     = "pwcRG"
  description = "Prefix for the resource group name"
}

variable "aks_cluster_name" {
  type        = string
  default     = "pwcAKS"
  description = "Prefix for the resource group name"
}

variable "node_count" {
  type        = number
  default     = 2
  description = "Number of nodes in the AKS node pool"
}

variable "acr_name" {
  type        = string
  default     = "pwcacr12345unique"
  description = "Prefix for the resource group name"
}
