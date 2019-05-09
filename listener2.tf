# -------------------
# Listener2
# -------------------
resource "aws_lb_listener" "l2_alb_listener" {
  count             = "${length(split(",", var.certificate_arn)) ? 1 : 0}"
  load_balancer_arn = "${aws_lb.alb.arn}"
  certificate_arn   = "${var.certificate_arn}"
  port              = "${var.listener2_alb_listener_port}"
  protocol          = "${var.listener2_alb_listener_protocol}"

  default_action {
    target_group_arn = "${aws_lb_target_group.l2_alb_target_group.arn}"
    type             = "forward"
  }
}

# -------------------
# Listener2 - Target Group
# -------------------
resource "aws_lb_target_group" "l2_alb_target_group" {
  name     = "${var.name}-${var.environment}-tg-listener2-${var.listener2_svc_port}"
  port     = "${var.listener2_svc_port}"
  protocol = "${var.listener2_target_group_protocol}"
  vpc_id   = "${var.vpc_id}"

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    interval            = "${var.interval}"
    protocol            = "${var.listener2_health_check_protocol}"
  }
}
