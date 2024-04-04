
echo "======================================================================="
echo "====                  take 1 install java                          ===="
echo "======================================================================="
sudo apt-get update -y
echo
echo
echo
sudo apt-get install openjdk-11-jdk -y
echo
echo
echo
echo javac version
javac -version
echo java version
java -version
echo
echo
echo
echo "======================================================================="
echo "====          install take 2 - jre java runtime                    ===="
echo "======================================================================="
sudo apt-get -qq install default-jre -y
echo "======================================================================="
echo "====                 install jdk and java compiler                 ===="
echo "======================================================================="
sudo apt-get -qq install default-jdk -y
echo "======================================================================="
echo "====                      java version                             ===="
echo "======================================================================="
java -version
echo "======================================================================="
echo "====              jdk and java compiler version                    ===="
echo "======================================================================="
javac -version
echo "======================================================================="
echo "====                      add to PATH                              ===="
echo "======================================================================="
update-alternatives --config java
JAVA_HOME="JAVA_HOME="/lib/jvm/java-11-openjdk-amd64/bin/java" >> /etc/environment"
source /etc/environment
echo $JAVA_HOME
echo "======================================================================="
echo "====                  take 2 install java                          ===="
echo "======================================================================="
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y
sudo apt-get install oracle-java8-set-default -y
javac -version

java -version

echo list files
ls 

echo make java folder
mkdir java

echo move files to java folder
mv ./script-38-java.java java

echo
echo
echo
echo list files
cd java
ls 
echo
echo
echo
echo compile java
javac ./script-38-java.java
echo
echo
echo
echo list files
ls
echo
echo
echo
echo run java
java HelloWorld
echo
echo
echo
echo done running java
echo
echo
echo