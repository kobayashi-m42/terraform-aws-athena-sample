// ログを格納するためのS3バケット
resource "aws_s3_bucket" "log" {
  bucket        = var.log_bucket_name
  force_destroy = true
}

// athenaの実行結果を格納するためのS3バケット
resource "aws_s3_bucket" "result" {
  bucket = var.athena_result_bucket_name
}

