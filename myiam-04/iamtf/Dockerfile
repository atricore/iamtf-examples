FROM atricore/iamtf:unstable

# Install IAM.tf custom extensions
USER atricore

# Copy the plugin containing our extensions (repository follows maven structure)
COPY extensions/org.atricore.idbus.examples.custom-identity-source-db-1.6.0.jar /opt/atricore/iamtf/server/extensions/org/atricore/idbus/examples/org.atricore.idbus.examples.custom-identity-source-db/1.6.0/

# Copy the configuration enabling our plugin
COPY features/iamtf-extensions-1.0.0-SNAPSHOT-features.xml /opt/atricore/iamtf/server/features/org/atricore/iamtf/iamtf-extensions/1.0.0-SNAPSHOT/

# Copy DB JDBC driver
COPY ./lib/jdbc/mariadb-java-client-2.7.3.jar /opt/atricore/iamtf/server/lib/jdbc/
