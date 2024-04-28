resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  service_connect_defaults {
    namespace = "arn:aws:servicediscovery:ap-southeast-2:251265884217:namespace/ns-2ddc2hevbcwkpmkf"
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster" {
    cluster_name = aws_ecs_cluster.ecs_cluster.name
    capacity_providers = ["FARGATE", "FARGATE_SPOT"]   
}



output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}