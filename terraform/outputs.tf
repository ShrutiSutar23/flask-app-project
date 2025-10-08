#from creating database we getting the output, and change the output to your .env file

output "db_endpoint" {
  value = aws_db_instance.mysql.endpoint
}

output "db_name" {
  value = aws_db_instance.mysql.db_name
}

