module "network" {
  source = "./assets/network"
  environment = "${var.environment}"
}

module "secdevops" {
  source = "./assets/secdevops"

  environment = "${var.environment}"

  vpc-id         = "${module.network.vpc-id}"
  vpc-cidr-block = "${module.network.vpc-cidr-block}"

  target_subnet_id = "${module.network.target_subnet_id}"
  attacker_subnet_id = "${module.network.attacker_subnet_id}"
  private-a-subnet-id = "${module.network.private-a-subnet-id}"
  private-b-subnet-id = "${module.network.private-b-subnet-id}"
}
