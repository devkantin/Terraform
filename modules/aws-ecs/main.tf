resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = var.container_insights_enabled ? "enabled" : "disabled"
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.cluster_name
    }
  )
}

resource "aws_ecs_task_definition" "task_definition" {
  family                   = var.task_family
  network_mode            = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                     = var.cpu
  memory                  = var.memory
  execution_role_arn      = var.execution_role_arn
  task_role_arn           = var.task_role_arn

  container_definitions = jsonencode(var.container_definitions)

  tags = merge(
    var.common_tags,
    {
      Name = var.task_family
    }
  )
}

resource "aws_ecs_service" "service" {
  count           = var.create_service ? 1 : 0
  name            = var.service_name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = var.desired_count
  launch_type     = var.launch_type

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  tags = merge(
    var.common_tags,
    {
      Name = var.service_name
    }
  )
}
