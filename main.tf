


resource "aws_oam_sink" "central_logging_sink" {
  name = local.sink_name
  tags = local.tags
}

resource "aws_oam_sink_policy" "central_logging_sink_policy" {
  sink_identifier = aws_oam_sink.central_logging_sink.id
  policy          = local.sink_policy
}
