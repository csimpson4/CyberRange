variable "ip_list" {
  description = "Lock this environment down to your IP"
    default     = "71.115.195.211/32"
}

variable "environment" {
  description = "the environment the deployment is running as"
}

variable "vpc-id" {
  description = "the vpc-id"
}

variable "vpc-cidr-block" {
  description = "the cidr block of the vpc"
}

variable "target_subnet_id" {
  description = "target subnet"
}

variable "attacker_subnet_id" {
  description = "attacker subnet"
}

variable "malware_subnet_id" {
  description = "malware subnet"
}

variable "honeypot_subnet_id" {
  description = "honeypot subnet"
}

variable "private-a-subnet-id" {
  description = "private subnet a"
}

variable "private-b-subnet-id" {
  description = "private subnet b"
}


variable "tpot_ct" {
  description = "# of tpot assets to create"
  default     = 1
}

variable "fbctf_ct" {
  description = "# of FBCTF assets to create"
  default     = 1
}

variable "kali_ct" {
  description = "# of kali assets to create"
  default     = 1
}

variable "docker_ct" {
  description = "# of docker assets to create"
  default     = 1
}

variable "instance_type_tpot" {
  description = "honeypot instance type"
  default     = "t2.large"
}

variable "instance_type_docker" {
  description = "docker instance type"
  default     = "t2.medium"
}

variable "instance_type" {
  description = "default instance type"
  default     = "t2.micro"
}

variable "instance_type_kali" {
  description = "kali instance type"
  default     = "t2.large"
}

variable "instance_type_win" {
  description = "windows instance type"
  default     = "t2.medium"
}

variable "tpot_root_vol_size" {
  description = "tpot root volume size"
  default     = "40"
}

variable "fbctf_root_vol_size" {
  description = "root / boot volume size"
  default     = "40"
}

variable "tpot_user_data" {
  description = "tpot cloud-init script"
  default     = "../../modules/infrastructure/cloud-init/tpot.setup.yml"
}

variable "fbctf_user_data" {
  description = "fbctf cloud-init script"
  default     = "../../modules/infrastructure/cloud-init/fbctf.setup.yml"
}

variable "win_bootstrap_user_data" {
  description = "win_bootstrap cloud-init script"
  default     = "../../modules/infrastructure/cloud-init/bootstrap.windows.yml"
}

variable "bootstrap_commando_userdata" {
  description = "commando cloud-init script"
  default     = "../../modules/infrastructure/cloud-init/bootstrap.commando.yml"
}

variable "bootstrap_flarevm_userdata" {
  description = "flarevm bootstrap cloud-init script"
  default     = "../../modules/infrastructure/cloud-init/bootstrap.flarevm.yml"
}

# setup a default user/pass for winrm connections
variable "winrm_user" {
  description = "The winrm user we login as"
  default = "terraform"
}

variable "winrm_pass" {
  description = "The winrm user password"
  default = "terraform"
}

variable "private_key" {
  description = "default private key"
  default     = "../../keys/circleci_terraform"
}

//todo: set up billing alarm automatically
variable "alarms_email" {
  description = "the email to notify you of excessive aws costs"
  default     = "your.email@this.com"
}

