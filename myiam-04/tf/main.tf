terraform {
  required_providers {
    iamtf = {
      version = "~> 0.6.3"
      source  = "atricore/iamtf"
    }
  }
}

provider "iamtf" {
  org_name      = "atricore"
  endpoint      = "http://localhost:8081/atricore-rest/services"
  client_id     = "idbus-f2f7244e-bbce-44ca-8b33-f5c0bde339f7"
  client_secret = "7oUHlv(HLT%vxK4L"
}

resource "iamtf_identity_appliance" "myiam-04" {
  name        = "myiam-04"
  namespace   = "com.atricore.devsso"
  description = "Appliance #1"
  location    = "http://localhost:8081"
  bundles     = ["org.atricore.idbus.examples.custom-identity-source-db"]
}
