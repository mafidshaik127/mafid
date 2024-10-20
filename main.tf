
provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
ami = "ami-0ddc798b3f1a5117e"
instance_type = "t2.micro"
tags = {
Name = "jenkins-pipeline"
}
}
