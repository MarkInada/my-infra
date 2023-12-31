# ---------------------------------------------
# key pair
# ---------------------------------------------
resource "aws_key_pair" "keypair" {
  key_name   = "${var.project}-${var.environment}-keypair"
  public_key = file("./src/minada-test-dev-keypair.pub")

  tags = {
    Name    = "${var.project}-${var.environment}-keypair"
    Project = var.project
    Env     = var.environment
  }
}

# ---------------------------------------------
# EC2 Instance
# ---------------------------------------------
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.app.id
  instance_type = "m5.large"
  # instance_type = "g4dn.xlarge"
  # instance_type               = "p3.2xlarge"
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true
  # iam_instance_profile        = aws_iam_instance_profile.app_ec2_profile.name
  vpc_security_group_ids = [
    aws_security_group.app_sg.id,
    aws_security_group.opmng_sg.id
  ]
  key_name = aws_key_pair.keypair.key_name
  # user_data                   = file("./src/initialize.sh")

  tags = {
    Name    = "${var.project}-${var.environment}-app-ec2"
    Project = var.project
    Env     = var.environment
    Type    = "app"
  }
}