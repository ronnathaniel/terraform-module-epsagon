
variable "aws_iam_role_name" {
    type = string
    description = "Epsagon IAM role name"
    default = "EpsagonRole"
}

variable "aws_account_id" {
    type = string
    description = "AWS Account ID"
}

variable "aws_external_id" {
    type = string
    description = "AWS External ID"
}