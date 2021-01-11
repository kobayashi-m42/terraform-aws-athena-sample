locals {
  role                      = "terraform-aws-athena-sample"
  log_bucket_name           = "${local.role}-log"
  athena_result_bucket_name = "${local.role}-result"
  athena_workgroup_name     = local.role
  athena_database_name      = replace("${local.role}-db", "-", "_")
  athena_table_name         = replace("${local.role}-table", "-", "_")
  glue_database_name        = replace("${local.role}-glue-db", "-", "_")
  glue_catalog_table_name   = replace("${local.role}-glue-teble", "-", "_")
  date_range_start          = "2020/01/10"
}
