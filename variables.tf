variable "certificate_arn" {}
variable "zone_id" {}
variable "friendly_name" {}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = "list"
}

variable "cidr_blocks" {
  default = "0.0.0.0/0"
}

variable "vpc_id" {}

variable "load_balancer_type" {
  default = "application"
}

variable "alb_allowed_ports" {
  default = "443"
}

#variable "subnetA" {}
#variable "subnetB" {}

variable "enable_deletion_protection" {
  default = "false"
}

variable "contact" {}

variable "orchestration" {}

variable "internal" {
  default = "true"
}

variable "environment" {}
variable "name" {}

variable "enable_cross_zone_load_balancing" {
  default = "true"
}

variable "healthy_threshold" {
  default = "4"
}

variable "unhealthy_threshold" {
  default = "4"
}

variable "interval" {
  default = "10"
}

# -----------------------------
# Listener 1 Variables 
# -----------------------------
variable "listener1_alb_listener_port" {
  default = "80"
}

variable "listener1_alb_listener_protocol" {
  default = "HTTP"
}

# -----------------------------
# Listener 2 Variables
# -----------------------------
variable "listener2_alb_listener_port" {
  default = "443"
}

variable "listener2_alb_listener_protocol" {
  default = "TLS"
}

variable "alb_listener2_port" {
  default = "443"
}

variable "alb_listener2_protocol" {
  default = "TLS"
}

variable "listener2_svc_port" {
  default = "443"
}

variable "listener2_target_group_protocol" {
  default = "TCP"
}

variable "listener2_target_id" {
  type        = "string"
  description = "ec2 instance(s) id to attach to listener2"
}

variable "listener2_health_check_protocol" {
  default = "TCP"
}