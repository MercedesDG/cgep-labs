output "bucket_arn" { value = aws_s3_bucket.primary.arn }
output "bucket_name" { value = aws_s3_bucket.primary.id }
output "log_bucket_arn" { value = aws_s3_bucket.log.arn }

output "encryption_algorithm" {
  description = "Server-side encryption algorithm in effect (SC-28 attestation)."
  value = one([
    for rule in aws_s3_bucket_server_side_encryption_configuration.primary.rule :
  rule.apply_server_side_encryption_by_default[0].sse_algorithm])
}

# The encryption_algorithm is a deliverate piece of evidence, SC-28 attestation in machine-readable form.
# value = one(...) - because rule block is a set, not a list (sets = not index addressable) - for makes single rule into a list, then one() extracts lone element.



