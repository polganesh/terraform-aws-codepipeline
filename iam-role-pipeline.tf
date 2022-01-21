resource "aws_iam_role" "pipeline" {
  count = var.role_arn == "" ? 1 : 0
  name = "rol-glob-${var.environment}-${var.cost_centre}-${var.app_service}CiCd-${random_string.pipeline-iam-role-policy-suffix.result}-${var.seq_id}"
  path  = "/service-role/"
  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codepipeline.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}