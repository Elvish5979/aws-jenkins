variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "Canned ACL for the bucket"
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Enable versioning?"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}