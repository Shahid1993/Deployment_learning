The process starts by creating the CSR and the private key:

    openssl req -nodes -newkey rsa:2048 -nodes -keyout dotmarks.net.key -out dotmarks.net.csr -subj "/C=GB/ST=London/L=London/O=dotmarks/OU=IT/CN=dotmarks.net"


**Generates**
* dotmarks.net.key
* dotmarks.net.csr


After validation, you will get a zip file with 4 files:
* AddTrustExternalCARoot.crt
* COMODORSAAddTrustCA.crt
* COMODORSADomainValidationSecureServerCA.crt
* dotmarks_net.crt

We have to create a certificate with all the intermediate certs.

    # order is important!
    cat dotmarks_net.crt COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt AddTrustExternalCARoot.crt > dotmarks.pem
    
To avoid the error `peer certificate cannot be authenticated with given ca certificates`, remove the externalCA:
 
    cat dotmarks_net.crt COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt  > dotmarks.pem
    

Once we have this pem file, we can configure nginx:


    ssl    on; 
    ssl_certificate         /etc/nginx/ssl/dotmarks.net/dotmarks.pem;
    ssl_certificate_key     /etc/nginx/ssl/dotmarks.net/dotmarks.net.key;


Then you just have to restart nginx:

  sudo service nginx reload
  sudo service nginx restart
