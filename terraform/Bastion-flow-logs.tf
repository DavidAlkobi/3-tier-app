resource "aws_flow_log" "example" {
  iam_role_arn    = "arn:aws:iam::214154033728:role/_vpc-flow-logs"
  log_destination  = "arn:aws:logs:us-east-1:214154033728:log-group:Bastion_logGroup:*"
  traffic_type    = "ALL"
  vpc_id          = module.vpc-Bastion.vpc_id
}

resource "aws_cloudwatch_log_group" "logGroup" {
  name = "Bastion_logGroup"
  count = var.create_log_group ? 1 : 0
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# #resource "aws_iam_role" "example" {
#   name               = "example"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# #}

data "aws_iam_policy_document" "example" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

#resource "aws_iam_role_policy" "example" {
 # name   = "example"
 # role   = aws_iam_role.example.id
  #policy = data.aws_iam_policy_document.example.json
#}
