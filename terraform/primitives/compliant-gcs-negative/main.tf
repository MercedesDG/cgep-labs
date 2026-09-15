module "data_bucket" {
    source      = "../../modules/compliant-gcs-bucket"

    gcp_project         = "project-413afb00-e6f0-4ab3-abe"
    project_label       = "cgep-lab"
    environment         = "prod"
    retention_days      = 30
    bucket_name_suffix   = "should-not-exist"
}