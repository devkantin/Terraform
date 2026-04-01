# AWS Auto Scaling Group Module

Creates Auto Scaling Groups with scaling policies for EC2 instances.

## Usage

```hcl
module "asg" {
  source = "./modules/aws-autoscaling"

  name                   = "my-asg"
  vpc_zone_identifier    = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  min_size               = 1
  max_size               = 5
  desired_capacity       = 2
  launch_template_id     = aws_launch_template.main.id
  
  target_group_arns = [aws_lb_target_group.app.arn]

  scaling_policies = {
    scale_up = {
      adjustment_type    = "ChangeInCapacity"
      scaling_adjustment = 1
    }
    scale_down = {
      adjustment_type    = "ChangeInCapacity"
      scaling_adjustment = -1
    }
  }
}
```

## Inputs

- `name` - ASG name (required)
- `vpc_zone_identifier` - Subnet IDs (required)
- `min_size` - Minimum size (default: 1)
- `max_size` - Maximum size (default: 3)
- `desired_capacity` - Desired capacity (default: 2)
- `launch_template_id` - Launch template ID (required)
- `target_group_arns` - Target group ARNs

## Outputs

- `asg_id` - The ASG ID
- `asg_name` - The ASG name
- `asg_arn` - The ASG ARN
- `policy_arns` - Map of policy ARNs
