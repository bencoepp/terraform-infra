module "ec2" {
  for_each = {
    for participant in var.participants : participant.name => participant
  }
  source = "./modules/ec2-instance"
  instance_name = "test-instance"
}