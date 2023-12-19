# a simple EC2 instance example complete with a keypair
resource "aws_instance" "example" {
  ami                         = locals.ec2_ami
  instance_type               = "t2.micro"
  iam_instance_profile        = aws_iam_instance_profile.ec2_role.name
  key_name                    = aws_key_pair.test-key.key_name
  tags   = var.default_tags
}

resource "aws_key_pair" "test-key" {
  key_name   = "test_key"
  public_key = "ssh-rsa testkeyDEADBEEFsdhf872377"
  tags       = var.default_tags
}
