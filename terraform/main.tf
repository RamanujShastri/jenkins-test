resource "aws_security_group" "TerraSecGrp"
{
  name        = "Wordpress-Secgrp"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"
  ingress
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }

  egress
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags
  {
    Name = "CreatedByTerraform"
  }

}

resource "aws_security_group" "DB-Secgroup"
{
  name = "DB-Secgroup"
  description = "for database"
  vpc_id      = "${aws_vpc.main.id}"
  ingress
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }
  
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags
  {
    Name = "DB-Secgrp"
  }
}
resource "aws_key_pair" "wordpress-KP"
  {
    key_name = "wordpress"
    public_key = "${file("${var.ssh_key}")}"

  }


resource "aws_instance" "wordpress"
{
  ami = "ami-8d948ced"
  depends_on = ["aws_security_group.TerraSecGrp","aws_key_pair.wordpress-KP"]
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.public_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.TerraSecGrp.id}"]
  key_name = "${aws_key_pair.wordpress-KP.id}"
  tags
  {
    Name = "Wordpress through terrafrom"
    Owner = "Ramanuj Shastri"
    Application = "Wordpress"
    Created = "This instance is created through terraform"
  }
  user_data = "${file("/home/ubuntu/terraform/two-tier-architecture/install.sh")}"

}


resource "aws_instance" "dbinstance"
{
  ami = "ami-8d948ced"
  depends_on = ["aws_security_group.TerraSecGrp","aws_key_pair.wordpress-KP"]
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.private_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.DB-Secgroup.id}"]
  key_name = "${aws_key_pair.wordpress-KP.id}"
  tags
  {
    Name = "DB instance through terrafrom"
    Owner = "Ramanuj Shastri"
    Application = "DB"
    Created = "This instance is created through terraform"
  }

}

