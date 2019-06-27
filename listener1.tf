# -------------------
# Listener1
# -------------------
resource "aws_lb_listener" "l1_alb_listener" {
  count             = "${var.http_listener_required ? 1 : 0}"
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "${var.listener1_alb_listener_port}"
  protocol          = "${var.listener1_alb_listener_protocol}"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
