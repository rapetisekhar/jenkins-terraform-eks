provider "aws" {
  region     = "ap-south-1"  # Specify your AWS region
  access_key = "AKIA47CRZCX4Y2MQ4QMW"     # Your AWS Access Key
  secret_key = "HTx8uE8+l1/9vccbJE65YFQdI1Nac5IcyTomb904"     # Your AWS Secret Key
}

# Define a new SSH key pair or use an existing one

# Define the EC2 instance
resource "aws_instance" "my_ec2" {
  ami           = "ami-08bf489a05e916bbd"  # Amazon Linux 2 AMI (change as needed)
  instance_type = "t2.micro"               # Instance type (e.g., t2.micro)
}
