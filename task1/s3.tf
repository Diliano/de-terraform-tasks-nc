resource "aws_s3_bucket" "task_1_bucket" {
  bucket_prefix = "task-1-bucket"

  tags = merge(
    var.default_tags,
    {
      Name = "Task 1 bucket" 
    }
  )
}

resource "aws_s3_object" "task_1_object" {
  bucket = aws_s3_bucket.task_1_bucket.bucket
  key = "test_file.txt"
  source = "test_file.txt"

  tags = merge(
    var.default_tags,
    {
      Name = "Task 1 object"
    }
  )
}