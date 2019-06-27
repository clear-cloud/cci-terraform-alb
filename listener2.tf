# -------------------
# Listener2
# -------------------
resource "aws_lb_listener" "l2_alb_listener" {
  count             = "${var.https_listener_required ? 1 : 0}"
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
    matcher             = "${var.matcher}"
    path                = "${var.path}"
  }
}

# -------------------
# Listener2 - Target Group Attachment
# -------------------
resource "aws_lb_target_group_attachment" "l2_target_group" {
  count            = "${length(split(",", var.listener2_target_id)) ? length(split(",", var.listener2_target_id)) : 0}"
  target_group_arn = "${aws_lb_target_group.l2_alb_target_group.arn}"
  target_id        = "${element(split(",",var.listener2_target_id), count.index)}"
  port             = "${var.listener2_svc_port}"
}

