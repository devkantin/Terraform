# AWS EBS Module

Creates EBS volumes with encryption, snapshots, and instance attachment.

## Usage

```hcl
module "ebs_volume" {
  source = "./modules/aws-ebs"

  volume_name       = "data-volume"
  availability_zone = "us-east-1a"
  size              = 200
  volume_type       = "gp3"
  iops              = 3000
  throughput        = 125
  
  encrypted = true
  instance_id = aws_instance.server.id

  create_snapshot = true

  common_tags = {
    Environment = "production"
  }
}
```

## Inputs

- `volume_name` - Volume name (required)
- `availability_zone` - AZ (required)
- `size` - Size in GiB (default: 100)
- `volume_type` - gp2, gp3, io1, io2, st1, sc1 (default: gp3)
- `iops` - IOPS (default: 3000)
- `throughput` - Throughput MiB/s (default: 125)
- `encrypted` - Enable encryption (default: true)
- `instance_id` - Instance to attach to

## Outputs

- `volume_id` - The volume ID
- `volume_arn` - The volume ARN
- `attachment_id` - The attachment ID
- `snapshot_id` - The snapshot ID
