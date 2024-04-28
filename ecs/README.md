# ECS Services Intercommunication

- `/services/` directory contain `users` and `books` apps in 
- Just run `docker-compose up --build` to test apps on `9001` and `9000` respectively

## Push containers to ECR repos
- create ECR repos for `books` and `users`
- build and push the images 
- create Task definition from the console. (This will be created via Terraform in future as well in the same repo)

## Terrafrom - Launch AWS resource
Run below command
- `terraform init`
- `terraform plan` to check everything is working as expected or not
- `terraform apply`
Note: Make sure to delete all AWS resources once satisfied - `terraform destroy`

