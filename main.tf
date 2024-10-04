provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  ami                    = "ami-0e54eba7c51c234f6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0cee9adebe6014f67"]
  key_name               = "mafidshaikpem"
  tags = {
    Name = "mafid"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install git httpd -y",
      "sudo yum systemctl start httpd",
      "sudo yum systemctl enable httpd",
      "sudo yum cd /var/www/html/",
      "sudo git clone  https://github.com/Ironhack-Archive/online-clone-amazon.git",
      "sudo mv online-clone-amazon/* /var/www/html/",
      "sudo systemctl restart httpd"

    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
  }
}


