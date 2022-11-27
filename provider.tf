provider "aws" {
  region = "eu-west-1"
}

 

resource "aws_instance" "AWS-instance" {
  count                   = 1
  key_name                = "x21242887-jenkins" 
  ami                     = "ami-096800910c1b781ba"
  vpc_security_group_ids  = ["sg-0fb0b81f7d9210a79"]
  instance_type           = "t2.micro"
  tags = {
    Name = "x21242887-test1"
  }

 

}
