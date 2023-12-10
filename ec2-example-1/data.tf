data "aws_prefix_list" "s3_pl" {
  name = "com.amazonaws.*.s3"
}

# ami-005696e90aeaf53ab
data "aws_ami" "app" {
  most_recent = true
  owners      = ["self", "amazon"]

  filter {
    name   = "name"
    values = ["Deep Learning AMI GPU PyTorch 1.12.0 (Ubuntu 20.04) 20220803"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}