locals {
  sink_arn              = aws_oam_sink.central_logging_sink.arn
  metric_resource_types = ["AWS::CloudWatch::Metric", "AWS::Logs::LogGroup", "AWS::XRay::Trace"]

}

resource "aws_oam_link" "oam_source_link" {
  for_each        = toset(var.link_account_names)
  sink_identifier = local.sink_arn
  label_template  = each.value
  resource_types  = local.metric_resource_types
  tags            = local.tags
}
