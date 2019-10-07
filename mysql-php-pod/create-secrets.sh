#!/bin/bash

# Create credentials in file
YELLOW='\033[1;33m'
RED='\033[0;31m' # Red color
NC='\033[0m' # No Color
printf "Enter password for MySql user ${RED}root${NC} and press <ENTER> or just press <ENTER> to use default ${YELLOW}password${NC}: "
read PASSWD
PASSWORD=""

if [ -z "$PASSWD" ]
then
      PASSWD="password"
      printf "Password was not entered. Will use default password: ${YELLOW}$PASSWD${NC}\n"
else
      printf "Will use: ${YELLOW}$PASSWD${NC} for password\n"
fi

USER=`echo -n 'root' | base64`
PASSWORD=`echo -n $PASSWD | base64`

cat > ./create-secret.yaml << EOF
apiVersion: v1
kind: Secret
metadata:
  name: mysql-credentials
type: Opaque
data:
  user: $USER
  ROOT_PASSWORD: $PASSWORD
EOF

kubectl apply -f ./create-secret.yaml
kubectl get secret mysql-credentials -o yaml
rm ./create-secret.yaml



#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37
