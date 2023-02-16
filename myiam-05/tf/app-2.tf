
// partenr application #2
resource "iamtf_app_agent" "partnerapp2" {
  ida  = iamtf_identity_appliance.myiam-05.name
  name = "partnerapp2"

  // Application base location
  app_location = "http://localhost:8080/partnerapp2"

  
  // Trusted identity providers
  idp {
    name         = iamtf_idp.idp-1.name
    is_preferred = true
  }

  // Weblogic server
  exec_env = iamtf_execenv_tomcat.tc.name

  keystore {
    resource     = filebase64("./saml.p12")
    password     = "changeme"
    key_password = "secret"
  }

}
