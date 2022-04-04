variable "foo" {
  value = "bar"
}

resource "aws_cloudwatch_log_group" "foo" {
  name = "foo"
}

output "foo" {
  value = "${aws_cloudwatch_log_group.foo.arn}"
}
