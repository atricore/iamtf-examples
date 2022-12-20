// partner application #1
resource "iamtf_app_oidc" "partnerapp1" {
  ida  = iamtf_identity_appliance.myiam-04.name
  name = "partnerapp1"

  client_id     = "m04-cli01"
  client_secret = "changeme"

  client_authn = "NONE" #PKCE
  grant_types  = ["AUTHORIZATION_CODE", "REFRESH_TOKEN"]

  signature_alg  = "HS256"
  encryption_alg = "NONE"
  redirect_uris  = ["http://localhost:3000"]
  response_types = ["CODE"]
  response_modes = ["QUERY"]

  // Application base location
  idp {
    name         = iamtf_idp.idp-1.name
    is_preferred = true
  }

  depends_on = [
    iamtf_identity_appliance.myiam-04
  ]

}
