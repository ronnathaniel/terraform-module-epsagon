
resource "aws_s3_bucket" "epsagon_trail" {

    bucket_prefix = "epsagon-trail-bucket"
    force_destroy = true

    lifecycle_rule {
        enabled = false
        expiration {
            days = 1
        }
    }

    tags = {
        Name = "Espagon CloudTrail Bucket"
    }
}

resource "aws_cloudformation_stack" "epsagon_stack" {
    name = "epsagon"

    template_url = "https://s3.amazonaws.com/epsagon-cloudformation/terraform_template.json"
    capabilities = ["CAPABILITY_NAMED_IAM"]

    parameters = {
        AWSAccount = var.aws_account_id
        ExternalId = var.aws_external_id
        ExternalBucketName = aws_s3_bucket.epsagon_trail.id
    }
}
