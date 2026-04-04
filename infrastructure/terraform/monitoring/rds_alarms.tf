resource "aws_cloudwatch_metric_alarm" "rds_freeable_memory_low" {
  alarm_name          = "rds-freeable-memory-low-prod"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 500000000 # 500 MB in bytes (~6% of db.t3.large 8 GB RAM)
  alarm_description   = "RDS freeable memory is critically low (below 500 MB)"
  treat_missing_data  = "notBreaching"

  dimensions = {
    DBClusterIdentifier = var.rds_cluster_identifier
  }

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}
