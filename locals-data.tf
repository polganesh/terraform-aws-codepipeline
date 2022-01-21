locals {
  role_arn  = var.role_arn == "" ? aws_iam_role.pipeline.0.arn : var.role_arn
  pipeline_name = "${var.pipeline_type}-glob-${var.environment}-${var.cost_centre}-${var.app_service}-${random_string.pipeline-iam-role-policy-suffix.result}-${var.seq_id}"
  generic_tags = {
    Environment = var.environment
    CostCentre  = var.cost_centre
    VersionId   = var.version_id
    BuildDate   = var.build_date
    AppService  = var.app_service
  }

}

data "aws_region" "current" {

}

resource "random_string" "pipeline-iam-role-policy-suffix" {
  length    = 3
  special   = false
  min_lower = 3
}