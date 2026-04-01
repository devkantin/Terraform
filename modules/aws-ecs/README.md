# AWS ECS Module

Provisions ECS clusters, task definitions, and services for container orchestration.

## Usage

```hcl
module "ecs" {
  source = "./modules/aws-ecs"

  cluster_name = "my-cluster"
  task_family  = "my-app"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = [
    {
      name      = "app"
      image     = "nginx:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          protocol      = "tcp"
        }
      ]
    }
  ]

  create_service = true
  service_name   = "my-service"
  desired_count  = 2

  subnet_ids         = [aws_subnet.private_1.id, aws_subnet.private_2.id]
  security_group_ids = [aws_security_group.ecs.id]
}
```

## Inputs

- `cluster_name` - Cluster name (required)
- `task_family` - Task family (required)
- `execution_role_arn` - Execution role ARN (required)
- `container_definitions` - Container definitions (required)
- `cpu` - CPU units (default: 256)
- `memory` - Memory in MB (default: 512)
- `launch_type` - FARGATE, EC2, EXTERNAL (default: FARGATE)

## Outputs

- `cluster_id` - The cluster ID
- `cluster_arn` - The cluster ARN
- `task_definition_arn` - Task definition ARN
- `service_arn` - Service ARN
