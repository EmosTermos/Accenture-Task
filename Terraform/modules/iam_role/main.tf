resource "aws_iam_role" "ec2_logging_role" {
  name               = "ec2-logginig-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy_attach" {
  role       = aws_iam_role.ec2_logging_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attach" {
  role       = aws_iam_role.ec2_logging_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_logging_profile" {
  name = "ec2-logging-profile"
  role = aws_iam_role.ec2_logging_role.name
}