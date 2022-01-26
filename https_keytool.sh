# server:
keytool -validity 1365 -genkey -v -alias forsrc -keyalg RSA -keystore forsr.keystore \
    -dname "CN=127.0.0.1,OU=forsrc.com,O=forsrc,L=sh,ST=sh,c=cn" \
    -storepass forsrc -keypass forsrc

# client
keytool -validity 1365 -genkeypair -v -alias client -keyalg RSA \
    -storetype PKCS12 -keystore  /home/madoka/cert/client.p12 \
    -dname "CN=client,OU=hd123.com,O=heading,L=sh,ST=sh,c=cn" \
    -storepass forsrc -keypass forsrc

# server trust client 
keytool -export -v -alias client -keystore client.p12 \
    -storetype PKCS12 -storepass forsrc -rfc -file client.cer 
keytool -import -v -alias client -file client.cer \
    -keystore forsrc.keystore -storepass forsrc

# server trust server
keytool -export -v -alias forsrc -keystore forsrc.keystore \
    -storepass forsrc -rfc -file server.cer
keytool -import -v -alias forsrc -file server.cer \
    -keystore client.truststore -storepass forsrc

# list
keytool -list -keystore  forsrc.keystore -storepass forsrc
