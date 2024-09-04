resource "aws_instance" "mongodb" {
  ami                    = var.ami_id
  instance_type          = "t3.nano"
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  root_block_device {
    volume_size = 25
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-mongodb"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y gnupg curl
              curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
              echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
              sudo apt-get update
              sudo apt-get install -y mongodb-org

              # Modify MongoDB configuration to allow access from any IP
              sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
              
              sudo systemctl start mongod
              sudo systemctl enable mongod
              EOF
}

resource "aws_eip" "mongodb_eip" {
  instance = aws_instance.mongodb.id
  domain   = "vpc"
}