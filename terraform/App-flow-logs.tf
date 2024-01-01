resource "aws_flow_log" "example2" {
  iam_role_arn    = "arn:aws:iam::214154033728:role/_vpc-flow-logs"
  log_destination  = "arn:aws:logs:us-east-1:214154033728:log-group:App_logGroup:*"
  traffic_type    = "ALL"
  vpc_id          = module.vpc-App.vpc_id
}

resource "aws_cloudwatch_log_group" "logGroup2" {
  name = "App_logGroup"
  count = var.create_log_group ? 1 : 0

}

