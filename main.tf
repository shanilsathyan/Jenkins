provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08c40ec9ead489470" # Ubuntu 22.04 LTS (HVM), SSD Volume Type - us-east-1
  instance_type = "t2.micro"

  key_name = "your-key" # replace with your actual EC2 key pair name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              docker run -d -p 80:5000 shanil4120/dockerized-flask-app:latest
              EOF

  tags = {
    Name = "FlaskAppServer-Ubuntu"
  }
}
