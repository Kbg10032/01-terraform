variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default     = "aws11-terraform-state"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in thins AWS account."
  type        = string
  default     = "aws11-terraform-locks"
}
