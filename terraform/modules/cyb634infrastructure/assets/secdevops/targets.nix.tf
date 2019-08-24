# Webgoat instance details
# original reference: https://github.com/BlacksInTechnologyOrg/bit-pentest-labs/blob/master/aws/terraform/modules/webgoat/webgoat.tf
locals {
  cyberRange_subnets_ids = [
    "${var.target_subnet_id}",
    "${var.attacker_subnet_id}",
  ]
}

resource "aws_instance" "cr_skytower" {
  count = "${var.docker_ct}"
  ami           = "${data.aws_ami.skytower.id}"
  instance_type = "${var.instance_type}"
  subnet_id              = "${element(local.cyberRange_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]
  key_name = "${aws_key_pair.circleci_key.key_name}"
  root_block_device {
    delete_on_termination = true
  }
  tags = {
    Name        = "CyberRange-Skytower-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

resource "aws_instance" "cr_vulnos" {
  count = "${var.docker_ct}"
  ami           = "${data.aws_ami.vulnos.id}"
  instance_type = "${var.instance_type}"
  subnet_id              = "${element(local.cyberRange_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]
  key_name = "${aws_key_pair.circleci_key.key_name}"
  root_block_device {
    delete_on_termination = true
  }
  tags = {
    Name        = "CyberRange-Vulnos-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

resource "aws_instance" "cr_mrrobot" {
  count = "${var.docker_ct}"
  ami           = "${data.aws_ami.mrrobot.id}"
  instance_type = "${var.instance_type}"
  subnet_id              = "${element(local.cyberRange_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]
  key_name = "${aws_key_pair.circleci_key.key_name}"
  root_block_device {
    delete_on_termination = true
  }
  tags = {
    Name        = "CyberRange-MrRobot-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

resource "aws_instance" "cr_fristileaks" {
  count = "${var.docker_ct}"
  ami           = "${data.aws_ami.fristileaks.id}"
  instance_type = "${var.instance_type}"
  subnet_id              = "${element(local.cyberRange_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]
  key_name = "${aws_key_pair.circleci_key.key_name}"
  root_block_device {
    delete_on_termination = true
  }
  tags = {
    Name        = "CyberRange-fristileaks-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

resource "aws_instance" "cr_bulldog" {
  count = "${var.docker_ct}"
  ami           = "${data.aws_ami.bulldog.id}"
  instance_type = "${var.instance_type_docker}"
  subnet_id              = "${element(local.cyberRange_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]
  key_name = "${aws_key_pair.circleci_key.key_name}"
  root_block_device {
    delete_on_termination = true
  }
  tags = {
    Name        = "CyberRange-bulldog-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

