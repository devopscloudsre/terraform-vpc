data "aws_subnet_ids" "privateonly" {
  vpc_id = aws_vpc.demo.id
  tags = {
      Name = "*Demo-private*"
  }
}

data "aws_subnet_ids" "secondary-private" {
  vpc_id = aws_vpc.demo.id
  tags = {
      Name = "*secondary*"
  }
}

output "vpcid" {
    value = aws_vpc.demo.id
}

output "privateSubnetonly" {
    description = "primary subnet ids.."
    value = [for s in data.aws_subnet_ids.privateonly.ids: s]
}

output "SecondarySubnet" {
    description = "secondary subnet ids.."
    value = [for s in data.aws_subnet_ids.secondary-private.ids: s]
}

