
resource "iamtf_idsource_db" "sso-users" {
  ida         = iamtf_identity_appliance.myiam-04.name
  description = "DB users"
  name        = "sso-users"

  # Connection information
  jdbc_driver   = "org.mariadb.jdbc.Driver"
  connectionurl = "jdbc:mariadb://db:3306/idm_db"
  username      = "josso"
  password      = "secret"

  # SQL queries to retrieve user information from the DB
  sql_username    = "SELECT LOGIN AS USERNAME FROM JOSSO_USER WHERE LOGIN = ?"
  sql_groups      = "SELECT R.ROLE FROM JOSSO_ROLE R, JOSSO_USER_ROLE UR, JOSSO_USER U WHERE R.ROLE = UR.ROLE AND  U.LOGIN = UR.LOGIN AND U.LOGIN = ?"
  sql_credentials = "SELECT LOGIN AS USERID, PASSWORD FROM JOSSO_USER WHERE LOGIN = ?"

  use_column_name_as_property_name = true
  sql_user_attrs                   = "SELECT FIRST_NAME, LAST_NAME, PHONE, E_MAIL AS EMAIL FROM JOSSO_USER WHERE LOGIN  = ?"

  sql_relay_credential = "SELECT login FROM josso_user WHERE #?# = ?"

  # connection pooling
  connection_pool = false

  # extension

  extension {
    fqcn = "org.atricore.idbus.examples.sso.dbsource.CustomIdSourceDB"
    type = "INSTANCE"
    property {
      name  = "label"
      value = "CUST-DB-SOURCE"
    }
  }

  depends_on = [
    iamtf_identity_appliance.myiam-04
  ]



}
