variable "cluster_name" {
  default = "blackforge-eks-cluster"
}

variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  description = "Your default VPC ID"
  default     = "vpc-091c696247c34d759" # your default VPC
}
variable "subnet_ids" {
  default = [
    "subnet-06ef86817eefbd900", # us-east-1a ✅
    "subnet-0c892d6be94d400b0", # us-east-1d ✅  here i used 1b
    "subnet-07b76369fb81198f9", # us-east-1c ✅
    "subnet-09b5d2e0f3368e560"  # 1d
  ]
}
