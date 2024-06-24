resource "aws_cloudwatch_metric_alarm" "foobar" {
  # for_each = toset(["terraform-test-foobar5","terraform-test-foobar6"])
  #  alarm_name = each.key

  for_each = tomap({
    domain-api-5xx      = "Metrics for 5xx"
    domain-api-4xx      = "Metrics for 4xx"
  
  })
  alarm_name      = each.key
  alarm_description = each.value


  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 120
  statistic                 = "Average"
  threshold                 = 80
  insufficient_data_actions = []
}