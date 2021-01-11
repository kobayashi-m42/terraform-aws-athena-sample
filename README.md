# terraform-aws-athena-sample

Terraform を利用して Amazon Athena を構築するサンプルコードです。

S3に保存されたJSON形式のデータにSQLを実行できる環境を構築します。

## Terraform Version

| Name | Version |
|------|---------|
| terraform | \>= 0.13 |
| aws | ~> 3.23.0 |

## サンプルデータ

S3バケットに下記のようなディレクトリで、サンプルデータを配置してください。

```
s3://<bucket_name>/logs/yyyy/MM/dd/sample-log
```
