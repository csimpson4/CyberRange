locals {
  cyberRange_windows_subnets_ids = [
    "${var.target_subnet_id}",
    "${var.attacker_subnet_id}",
  ]
}


resource "aws_instance" "win2008" {
  count = "${var.docker_ct}"
  ami           = "${data.aws_ami.win2k8.id}"
  instance_type = "${var.instance_type}"
  subnet_id              = "${element(local.cyberRange_windows_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]
  key_name = "${aws_key_pair.circleci_key.key_name}"
  root_block_device {
    delete_on_termination = true
  }
  tags = {
    Name        = "CyberRange-win2008-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

resource "aws_instance" "cr_ms3_2k8" {
  count = "${var.docker_ct}"

  ami           = "${data.aws_ami.ms3_2k8.id}"
  instance_type = "${var.instance_type_win}"

  subnet_id              = "${element(local.cyberRange_windows_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]

  key_name = "${aws_key_pair.circleci_key.key_name}"

  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name        = "CyberRange-MetaSploitable_3_win2k8-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

resource "aws_instance" "win7" {
  count         = "${var.docker_ct}"
  ami           = "${data.aws_ami.win7.id}"
  instance_type = "${var.instance_type}"
  subnet_id               = "${element(local.cyberRange_windows_subnets_ids, count.index)}"
  vpc_security_group_ids  = ["${aws_security_group.targets.id}"]
  key_name                = "${aws_key_pair.circleci_key.key_name}"
  user_data               = "${var.win_bootstrap_user_data}"
  root_block_device {
    delete_on_termination = true
  }
  tags = {
    Name        = "CyberRange-win7-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}

resource "aws_instance" "ami_ms3_2k12" {
  count = "${var.docker_ct}"
  ami           = "${data.aws_ami.ms3_2k12.id}"
  instance_type = "${var.instance_type_win}"
  subnet_id              = "${element(local.cyberRange_windows_subnets_ids, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.targets.id}"]
  key_name = "${aws_key_pair.circleci_key.key_name}"
  root_block_device {
    delete_on_termination = true
  }

  tags = {
    Name        = "CyberRange-MetaSploitable_3_win2k12-${count.index}"
    Environment = "${var.environment}"
    Terraform   = "True"
  }
}


