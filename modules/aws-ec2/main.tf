resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = true
    encrypted             = var.ebs_encrypted
  }

  monitoring                  = var.detailed_monitoring
  iam_instance_profile        = var.iam_instance_profile
  user_data                   = var.user_data
  user_data_base64            = var.user_data_base64

  tags = merge(
    var.common_tags,
    {
      Name = var.instance_name
    }
  )

  depends_on = var.depends_on
}
