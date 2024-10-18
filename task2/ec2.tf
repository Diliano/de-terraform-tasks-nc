resource "aws_instance" "task_2_instance" {
  ami                    = data.aws_ami.amzn-linux-2023-ami.id
  instance_type          = "t2.micro"
  key_name               = "TerraformTasks"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  
  user_data = file("script.sh")
  user_data_replace_on_change = true

  tags = {
    Name = "Task2Instance"
  }
}