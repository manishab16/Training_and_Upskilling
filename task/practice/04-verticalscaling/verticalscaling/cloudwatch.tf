# High CPU alarm -> want to scale UP
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.project_name}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_scale_up_threshold
  alarm_description   = "CPU too high, scale up"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.vertical_demo.id
  }
}

# Low CPU alarm -> want to scale DOWN
resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.project_name}-cpu-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 5
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.cpu_scale_down_threshold
  alarm_description   = "CPU too low, scale down"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.vertical_demo.id
  }
}

# EventBridge rule: react to ALARM state from those two alarms
resource "aws_cloudwatch_event_rule" "alarm_to_lambda" {
  name        = "${var.project_name}-alarm-to-lambda"
  description = "Send CloudWatch Alarm state changes to Lambda"

  event_pattern = jsonencode({
    "source": ["aws.cloudwatch"],
    "detail-type": ["CloudWatch Alarm State Change"],
    "detail": {
      "alarmName": [
        aws_cloudwatch_metric_alarm.cpu_high.alarm_name,
        aws_cloudwatch_metric_alarm.cpu_low.alarm_name
      ],
      "state": {
        "value": ["ALARM"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "alarm_target_lambda" {
  rule      = aws_cloudwatch_event_rule.alarm_to_lambda.name
  target_id = "VerticalScalerLambda"
  arn       = aws_lambda_function.vertical_scaler.arn
}

# Allow EventBridge to invoke Lambda
resource "aws_lambda_permission" "allow_events" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.vertical_scaler.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.alarm_to_lambda.arn
}
