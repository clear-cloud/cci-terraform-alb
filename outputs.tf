output "sg_id" {
  value = "${aws_security_group.alb_sg.id}"
}

output "listener2_arn" {
  value = "${aws_lb_target_group.l2_alb_target_group.*.arn}"
}

output "listener2_name" {
  value = "${join(",", aws_lb_target_group.l2_alb_target_group.*.name)}"
}

