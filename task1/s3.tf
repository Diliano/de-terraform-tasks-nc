resource "aws_s3_bucket" "task_1_bucket" {
  bucket_prefix = "task-1-bucket"

  tags = {
    Name        = "Task 1 bucket"
    Environment = "Dev"
  }
}

# resource "aws_s3_object" "demo_object" {
#   # TO BE IMPLEMENTED
# }