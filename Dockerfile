rm -rf docker-jenkins-build
mkdir docker-jenkins-build
cd docker-jenkins-build

cp /var/lib/jenkins/workspace/AddBookPackage/target/addressbook.war .

cat << 'EOF' > Dockerfile
FROM tomcat
ADD addressbook.war /usr/local/tomcat/webapps/
CMD "catalina.sh" "run"
EOF

sudo docker build . -t nivesingh/nive-addressbook:$BUILD_NUMBER
sudo docker push nivesingh/nive-addressbook:$BUILD_NUMBER
