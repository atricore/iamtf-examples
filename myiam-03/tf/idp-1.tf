resource "iamtf_idp" "idp-1" {
  ida  = iamtf_identity_appliance.myiam-03.name
  name = "idp-1"

  keystore {
    resource = filebase64("./saml.p12")
    password = "changeme"
  }

  authn_bind_ldap {
    priority          = 0
    provider_url      = "ldap://openldap:1389"
    username          = "cn=admin,dc=devsso1,dc=atricore,dc=com"
    password          = "secret"
    authentication    = "simple"
    password_policy   = "none"
    perform_dn_search = false

    // Users
    users_ctx_dn = "ou=users,dc=devsso1,dc=atricore,dc=com"
    userid_attr  = "uid"

    saml_authn_ctx    = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
    referrals         = "follow"
    operational_attrs = false

  }

  oidc {
    enabled = true
    user_claims_in_access_token = false
  }

  id_sources = [iamtf_idsource_ldap.sso-users.name]

}
