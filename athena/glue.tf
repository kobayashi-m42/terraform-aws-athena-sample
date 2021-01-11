resource "aws_glue_catalog_database" "this" {
  name = var.glue_catalog_database_name
}

resource "aws_glue_catalog_table" "this" {

  database_name = aws_glue_catalog_database.this.name
  name          = var.glue_catalog_table_name

  table_type = "EXTERNAL_TABLE"

  parameters = {
    "projection.enabled"                 = "true"
    "projection.orderdate.format"        = "yyyy/MM/dd"
    "projection.orderdate.type"          = "date"
    "projection.orderdate.interval"      = "1"
    "projection.orderdate.interval.unit" = "DAYS"
    "projection.orderdate.range"         = "${var.date_range_start},NOW"
    "storage.location.template"          = "s3://${var.log_bucket_name}/logs/$${orderdate}"
  }

  storage_descriptor {
    location      = "s3://${var.log_bucket_name}/logs"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat"
    ser_de_info {
      serialization_library = "org.openx.data.jsonserde.JsonSerDe"
      parameters = {
        "serialization.format" = "1"
      }
    }

    columns {
      name = "level"
      type = "string"
    }
    columns {
      name = "msg"
      type = "string"
    }
    columns {
      name = "name"
      type = "struct<first:string,last:string>"
    }
    columns {
      name = "time"
      type = "string"
    }
  }
  partition_keys {
    name = "orderdate"
    type = "string"
  }
}
