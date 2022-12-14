provider "aws" {
  region = "eu-west-1"
}

 

resource "aws_instance" "AWS-instance" {
  key_name                = "x21242887-jenkins" 
  ami                     = "ami-064315ff4c7427d8d"
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
  
  provisioner "file" {
    source      = "aoedjango.service"
    destination = "aoedjango.service"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("x21242887-jenkins.pem")
      host        = aws_instance.AWS-instance.public_ip

    }
    
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo cp aoedjango.service /etc/systemd/system/"
    ]
  }
  
}
