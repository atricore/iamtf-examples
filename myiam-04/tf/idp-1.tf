resource "iamtf_idp" "idp-1" {
  ida  = iamtf_identity_appliance.myiam-04.name
  name = "idp-1"

  keystore {
    resource = filebase64("./saml.p12")
    password = "changeme"
  }


  authn_basic {
    priority     = 0
    pwd_hash     = "SHA-256"
    pwd_encoding = "BASE64"
  }

  id_sources = [iamtf_idsource_db.sso-users.name]

  oidc {
    enabled = true
  }

  depends_on = [
    iamtf_identity_appliance.myiam-04
  ]

}
