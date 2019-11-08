resource "aws_security_group" "something-sg" {
  name        = "${var.stack_name}-sg"
  description = "${var.environment} SomeThing"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${var.stack_name}-sg"
    )
  )}"
}

resource "aws_security_group_rule" "something_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.something-sg.id}"
}

resource "aws_security_group_rule" "something_443" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = "${var.something_ingress_cidr}"
  security_group_id = "${aws_security_group.something-sg.id}"
}
