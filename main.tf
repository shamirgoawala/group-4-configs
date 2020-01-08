resource "aws_key_pair" "SamNew" {
   key_name   = "SamNew-key"
   public_key = "ssh-rsa yourshkey...-ebook"

}


resource "aws_instance" "Masters" {
  count = 1
  ami = "ami-00a208c7cdba991ea"
  instance_type = "t2.medium"

    associate_public_ip_address=true
    key_name = "SamNew-key"

  vpc_security_group_ids=["default"]
  tags={
  Name = "master0${count.index}"
}
}


resource "aws_instance" "Workers" {
  count = 1
  ami = "ami-00a208c7cdba991ea"
  instance_type = "t2.micro"

    associate_public_ip_address=true
    key_name = "SamNew-key"


  vpc_security_group_ids=["default"]


  tags={
  Name = "Worker0${count.index}"

}
}






