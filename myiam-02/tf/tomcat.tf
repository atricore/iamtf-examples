// Tocmat 8.5 JOSSO agent
resource "iamtf_execenv_tomcat" "tc" {
  ida         = iamtf_identity_appliance.myiam-02.name
  name        = "tc"
  description = "Tomcat 8.5"
  version     = "8.5"
}
