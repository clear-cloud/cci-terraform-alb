# -------------------
# Listener1
# -------------------
#resource "aws_alb_listener" "l1_alb_listener" {
#  load_balancer_arn = "${aws_lb.alb.arn}"
#  port              = "${var.listener1_alb_listener_port}"
#  protocol          = "${var.listener1_alb_listener_protocol}"

#  default_action {
#    target_group_arn = "${aws_lb_target_group.l1_alb_target_group.arn}"
#    type             = "forward"
#  }
#}

resource "aws_lb_listener" "l1_alb_listener" {
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
