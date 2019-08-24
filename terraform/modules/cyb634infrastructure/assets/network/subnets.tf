
resource "aws_subnet" "attacker_subnet" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = true

  tags = {
    name        = "attacker_subnet"
    environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "target_subnet" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
//  map_public_ip_on_launch = true

  tags = {
    name        = "target_subnet"
    environment = "${var.environment}"
  }
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_subnet" "malware_subnet" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = true

  tags = {
    name        = "malware_subnet"
    environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_subnet" "honeypot_subnet" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = true

  tags = {
    name        = "malware_subnet"
    environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "private-a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.253.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags = {
    name        = "not-in-use-private-a"
    environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_subnet" "private-b" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.252.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    name        = "not-in-use-private-b"
    environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

