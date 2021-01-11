resource "aws_athena_workgroup" "this" {
  name = var.athena_workgroup_name

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = false
    result_configuration {
      output_location = "s3://${var.athena_result_bucket_name}/athena-result/"
    }
  }
}

resource "aws_athena_database" "this" {
  name   = var.athena_database_name
  bucket = var.log_bucket_name
}

data "template_file" "create_table_sql" {
  template = file("${path.module}/sql/create-table.sql.tpl")
  vars = {
    athena_database_name = var.athena_database_name
    athena_table_name    = var.athena_table_name
    log_bucket_name      = var.log_bucket_name
  }
}

resource "aws_athena_named_query" "create_table" {
  name        = "Create table"
  description = "テーブルを作成"
  workgroup   = var.athena_workgroup_name
  database    = var.athena_database_name
  query       = data.template_file.create_table_sql.rendered

  depends_on = [aws_athena_workgroup.this]
}

