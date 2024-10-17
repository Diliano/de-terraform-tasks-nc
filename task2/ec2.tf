resource "aws_instance" "task_2_instance" {
  ami           = "ami-0acc77abdfc7ed5a6"
  instance_type = "t2.micro"

  tags = {
    Name = "Task2Instance"
  }
}