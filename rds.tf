# Create a DB Subnet Group (required for RDS instances in a VPC)
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group"
  description = "My DB Subnet Group"

  # Substitute these subnet IDs with the ones you have
  subnet_ids = ["subnet-abcdefgh", "subnet-ijklmnop"]
}

# Create an RDS instance
resource "aws_db_instance" "my_db_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "mydb"
  username             = "test_username" # Would usually fetch these from AWS params or secrets manager etc
  password             = "test_password" # ^^
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name

  vpc_security_group_ids = ["sg-12345678"]
  skip_final_snapshot = true
}
