resource "aws_ecs_service" "books-api" {
    name            = "books-api"
    cluster         = aws_ecs_cluster.ecs_cluster.id
    task_definition = "arn:aws:ecs:ap-southeast-2:251265884217:task-definition/books-api:5"
    desired_count   = 1
    launch_type     = "FARGATE"
    # enable_execute_command = true
    
    network_configuration {
        subnets          = ["subnet-0bec5ba299a18a00f", "subnet-0e1fe2a14721635c2", "subnet-0e0ebae51f8b98d83"]
        security_groups  = ["sg-00bd0f966e39d7d74"]
        assign_public_ip = true
    }

    service_connect_configuration {
        enabled = true
        namespace = aws_ecs_cluster.ecs_cluster.service_connect_defaults[0].namespace
        service {
          port_name = "books-api"
          discovery_name = "books-api"
          client_alias {
            port = 9000
          }
        }
    }  
    
}