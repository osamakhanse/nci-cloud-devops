provider "aws" {
  region = "eu-west-1"
}

 

resource "aws_instance" "AWS-instance" {
  key_name                = "x21242887-jenkins" 
  ami                     = "ami-034f5e483946a7d79"
  vpc_security_group_ids  = ["sg-0fb0b81f7d9210a79"]
  instance_type           = "t2.micro"
  tags = {
    Name = "team7-Devops-v1.0"
  }
}
  
resource "null_resource" "name" {

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("x21242887-jenkins.pem")
    host        = aws_instance.AWS-instance.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir appsteam7-1"
    ]
  }
}
