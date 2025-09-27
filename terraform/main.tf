provider "aws" {
  region = var.aws_region
}
resource "aws_db_subnet_group" "default" {
  name       = "flask-db-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "flask-db-subnet-group"
  }
}
resource "aws_security_group" "db_sg" {
  name        = "flask-db-sg"
  description = "Allow DB access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "mysql" {
  identifier             = "flask-db"
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = var.db_username
  password               = var.db_password # ✅ Correct
  db_name                = var.db_name     # ✅ Use db_name here
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name

  tags = {
    Name = "flask-db"
  }
}
