variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (e.g., production, staging)"
  type        = string
  default     = "production"
}

variable "db_instance_arn" {
  description = "The ARN of the RDS instance to backup"
  type        = string
}

variable "pagerduty_routing_key" {
  description = "PagerDuty routing key for critical alerts"
  type        = string
  sensitive   = true
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 30
}

variable "allowed_ips" {
  description = "List of IP addresses allowed to access the staging environment"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Default to all, but will be overridden in staging
}

variable "slack_webhook_url" {
  description = "Slack webhook URL for deployment notifications"
  type        = string
  sensitive   = true
  default     = ""
}

# --- Monitoring / alarms (issue #1416) ---

variable "ecs_cpu_threshold" {
  description = "ECS service CPU utilization (%) that triggers an alarm"
  type        = number
  default     = 80
}

variable "ecs_memory_threshold" {
  description = "ECS service memory utilization (%) that triggers an alarm"
  type        = number
  default     = 80
}

variable "rds_free_storage_threshold_gb" {
  description = "RDS free storage (GB) below which an alarm fires"
  type        = number
  default     = 2
}

variable "rds_max_connections_threshold" {
  description = "RDS connection count above which an alarm fires"
  type        = number
  default     = 80
}

variable "backend_5xx_rate_threshold" {
  description = "Backend 5xx error rate (% of requests) that triggers an alarm"
  type        = number
  default     = 1
}

variable "alb_arn_suffix" {
  description = "ARN suffix of the ALB in front of the backend (e.g. app/stellarkraal-alb/abc123). The 5xx alarm is skipped when empty."
  type        = string
  default     = ""
}

variable "slack_team_id" {
  description = "Slack workspace (team) ID authorized in AWS Chatbot. Slack delivery is skipped when empty."
  type        = string
  default     = ""
}

variable "slack_oncall_channel_id" {
  description = "Slack channel ID of the on-call channel that receives alarm notifications"
  type        = string
  default     = ""
}
