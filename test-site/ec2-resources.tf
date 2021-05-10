# The test sites will use free-tier nodes.
# They are only being used testing ICMP.
data "aws_ami" "free" {
  most_recent = true
  owners      = ["amazon"]
  name_regex  = "^amzn2-ami-hvm.*"
}

resource "aws_network_interface" "probe" {
  subnet_id       = aws_subnet.site.id
  security_groups = [aws_security_group.ping_ssh.id]
}

resource "aws_eip" "probe" {
  vpc                       = true
  network_interface         = aws_network_interface.probe.id
  associate_with_private_ip = sort(aws_network_interface.probe.private_ips)[0]
  depends_on                = [aws_internet_gateway.site]
}

resource "aws_network_interface" "node" {
  subnet_id       = aws_subnet.site.id
  security_groups = [aws_security_group.ping_ssh.id]
}

resource "aws_instance" "probe" {
  ami           = data.aws_ami.free.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.ssh_client.id

  availability_zone = var.az

  network_interface {
    network_interface_id = aws_network_interface.probe.id
    device_index         = 0
  }
}

resource "aws_instance" "node" {
  ami           = data.aws_ami.free.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.ssh_client.id

  availability_zone = var.az

  network_interface {
    network_interface_id = aws_network_interface.node.id
    device_index         = 0
  }
}
