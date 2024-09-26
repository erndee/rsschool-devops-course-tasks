# Create a GithubAction IAM role
resource "aws_iam_role" "gh_actions_role" {
  name = "gh_actions_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::123456123456:oidc-provider/token.actions.githubusercontent.com"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringLike" : {
            "token.actions.githubusercontent.com:sub" : "repo:erndee/rsschool-devops-course-tasks:*"
          },
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          }
        }
      },
    ]
  })
}

# Attach the required policies to the GithubAction IAM role
resource "aws_iam_policy_attachment" "s3_policy" {
  name       = "s3_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}

resource "aws_iam_policy_attachment" "dynamodb_policy" {
  name       = "dynamodb_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}

resource "aws_iam_policy_attachment" "ec2_policy" {
  name       = "ec2_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}

resource "aws_iam_policy_attachment" "route53_policy" {
  name       = "route53_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}

resource "aws_iam_policy_attachment" "iam_policy" {
  name       = "iam_policy"
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}

resource "aws_iam_policy_attachment" "vpc_policy" {
  name       = "vpc_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}

resource "aws_iam_policy_attachment" "sqs_policy" {
  name       = "sqs_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}

resource "aws_iam_policy_attachment" "event_bridge_policy" {
  name       = "event_bridge_policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  roles      = [aws_iam_role.gh_actions_role.name]
}
