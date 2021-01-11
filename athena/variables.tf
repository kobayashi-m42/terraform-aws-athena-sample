variable "log_bucket_name" {
  description = "ログが保存されているS3バケット名"
}
variable "athena_database_name" {
  description = "任意のデータベース名"
}
variable "athena_result_bucket_name" {
  description = "Athenaの結果を出力するためのS3バケット名"
}
variable "athena_workgroup_name" {
  description = "Athena Workgroup名"
}
variable "athena_table_name" {
  description = "任意のテーブル名"
}

variable "glue_catalog_database_name" {
  description = "任意のデータベース名"
}

variable "glue_catalog_table_name" {
  description = "任意のテーブル名"
}

variable "date_range_start" {}

