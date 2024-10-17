resource "aws_s3_bucket" "task_1_bucket" {
  bucket_prefix = "task-1-bucket"

  tags = {
    Name        = "Task 1 bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "task_1_object" {
  bucket = aws_s3_bucket.task_1_bucket.bucket
  key = "test_file.txt"
  source = "test_file.txt"
}