resource "aws_instance" "bbu_private_webserver" {
  ami                     = "${var.ami}"
  instance_type           = "${var.instance_type}"
  count                   = "${var.instance_count}"
  subnet_id               = "${var.subnet_id}"
  key_name                = "${var.aws_key_pair}"
  monitoring              = "${var.monitoring}"
  vpc_security_group_ids  = ["${var.vpc_security_group_ids}"]
  iam_instance_profile    = "${var.iam_instance_profile}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  private_ip              = "${var.private_ip}"
  ipv6_address_count      = "${var.ipv6_address_count}"
  ipv6_addresses          = "${var.ipv6_addresses}"
  ebs_optimized           = "${var.ebs_optimized}"
  volume_tags             = "${var.volume_tags}"
  root_block_device       = "${var.root_block_device}"
  ebs_block_device        = "${var.ebs_block_device}"
  ephemeral_block_device  = "${var.ephemeral_block_device}"
  source_dest_check       = "${var.source_dest_check}"
  disable_api_termination = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  placement_group         = "${var.placement_group}"
  tenancy                 = "${var.tenancy}"
  tags {
    Name  = "${element(var.instance_tags,count.index)}"
    Batch = "Cluster"
  }
}