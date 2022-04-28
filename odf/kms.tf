resource "aws_kms_key" "odf" {
  description = "ODF Managed Service"
  key_usage   = "SIGN_VERIFY"
  customer_master_key_spec = "RSA_4096"
}  
