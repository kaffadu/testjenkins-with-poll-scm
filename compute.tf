data "aws_ami" "ec2_instance" {

    most_recent = true
    owners      = ["amazon"]


    filter {
    name   = "virtualization-type"
    values = ["hvm"]
    }

    filter {
    name   = "architecture"
    values = ["x86_64"]
    }

    filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2*"]
    }

}


resource "aws_instance" "seljenkins-server" {
    ami           = data.aws_ami.ec2_instance.id
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.seljenkins-pubsub.id
    key_name      = aws_key_pair.seljenkins-key.key_name
    security_groups = [aws_security_group.seljenkins-sg.id]

    tags = {
        Name = "testserver"
    }
}


resource "aws_instance" "seljenkins-server2" {
    ami           = data.aws_ami.ec2_instance.id
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.seljenkins-pubsub.id
    key_name      = aws_key_pair.seljenkins-key.key_name
    security_groups = [aws_security_group.seljenkins-sg.id]

    tags = {
        Name = "testserver2"
    }
}