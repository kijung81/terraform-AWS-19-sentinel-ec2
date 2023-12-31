data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "golfzon-ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.small"
  subnet_id = aws_subnet.golfzon-subnet.id

  tags = {
    Name = "golfzon-poc"
  }
}