resource "aws_ecr_repository" "medusa" {
  name = "medusa-backend"
  
  image_scanning_configuration {
    scan_on_push = true
  }
  
  tags = {
    Name = "medusa-backend"
  }
}

resource "aws_vpc" "medusa_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = "true"

  tags = {
    Name = "medusa-vpc"
  
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.medusa_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "medusa-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.medusa_vpc.id
  cidr_block              = var.private_subnet_cidr

  tags = {
    Name = "medusa-private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.medusa_vpc.id

  tags = {
    Name = "medusa-igw"
  }
}

resource "aws_route_table" "pubic_route_table" {
  vpc_id = aws_vpc.medusa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "medusa-public-route-table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.pubic_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.medusa_vpc.id

  tags = {
    Name = "medusa-private-route-table"
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_ecs_cluster" "medusa_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "medusa_task" {
  family                   = var.task_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "medusa"
    image     = "medusajs/medusa:latest"
    essential = true
    memory    = 512
    cpu       = 256
    portMappings = [
      {
        containerPort = 9000
        hostPort      = 9000
      }
    ]
  }])

  tags = {
    Name = var.task_name
  }
}

resource "aws_ecs_service" "medusa_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.medusa_cluster.id
  task_definition = aws_ecs_task_definition.medusa_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.public_subnet.id]
    assign_public_ip = true
  }

  tags = {
    Name = var.service_name
  }
}
