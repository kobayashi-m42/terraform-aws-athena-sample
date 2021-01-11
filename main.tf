module "athena" {
  source = "./athena"

  athena_result_bucket_name  = local.athena_result_bucket_name
  athena_workgroup_name      = local.athena_workgroup_name
  log_bucket_name            = local.log_bucket_name
  athena_database_name       = local.athena_database_name
  athena_table_name          = local.athena_table_name
  glue_catalog_database_name = local.glue_database_name
  glue_catalog_table_name    = local.glue_catalog_table_name
  date_range_start           = local.date_range_start
}
