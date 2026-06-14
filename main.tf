resource "aws_vpc" "my_project_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "my_project_vpc"
  }
}

resource "aws_subnet" "my_public_subnet" {
    vpc_id = aws_vpc.my_project_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "my_public_subnet"
    }

}

resource "aws_internet_gateway" "my_vpc_igw" {
  vpc_id = aws_vpc.my_project_vpc.id
  tags = {
      Name = "my_vpc_igw"
  }
}

resource "aws_route_table" "my_project_rtb" {
  vpc_id = aws_vpc.my_project_vpc.id
  route {
      gateway_id = aws_internet_gateway.my_vpc_igw.id
      cidr_block = "0.0.0.0/0"
  }
  tags = {
      Name = "my_project_rtb"
  }
}

resource "aws_route_table_association" "my_rtb_associates" {
  route_table_id = aws_route_table.my_project_rtb.id
  subnet_id = aws_subnet.my_public_subnet.id
}

resource "aws_security_group" "my_vpc_sg" {
    vpc_id = aws_vpc.my_project_vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "my_vpc_sg"
    }
}

resource "aws_instance" "my_project_web_server" {
  ami = var.instance_ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_vpc_sg.id]
  subnet_id = aws_subnet.my_public_subnet.id
  tags = {
      Name = "my_project_web_server"

  }
}

resource "aws_s3_bucket" "amzn_s3_project_bucket_01" {
  bucket = "my-project-amzn-s3-bucket-01"
}