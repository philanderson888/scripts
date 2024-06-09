
echo "======================================================================="
echo "====                  take 1 install java                          ===="
echo "======================================================================="
echo sudo apt get update silent
sudo apt-get -qq update -y
echo
echo
echo
echo sudo apt get install open jdk silent 
sudo apt-get install openjdk-11-jdk -y > /dev/null
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
echo * * * possibly no need to do this as it has already installed * * * 
sleep 1
echo "======================================================================="
echo "====          install take 2 - jre java runtime                    ===="
echo "======================================================================="
echo sudo apt get install default jre silent
sudo apt-get -qq install default-jre -y > /dev/null
echo "======================================================================="
echo "====                 install jdk and java compiler                 ===="
echo "======================================================================="
echo sudo apt gett install default jdk silent
sudo apt-get -qq install default-jdk -y > /dev/null
echo "======================================================================="
echo "====              jdk and java compiler version                    ===="
echo "====          not needed - version did not update since last one   ===="
echo "======================================================================="
java -version
javac -version
echo "======================================================================="
echo "====                      add to PATH                              ===="
echo "======================================================================="
update-alternatives --config java
JAVA_HOME="JAVA_HOME="/lib/jvm/java-11-openjdk-amd64/bin/java" >> /etc/environment"
source /etc/environment
echo $JAVA_HOME
echo "======================================================================="
echo "====                  take 3 install java   - not needed           ===="
echo "======================================================================="
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -qq update -y > /dev/null
sudo apt-get -qq install oracle-java8-installer -y > /dev/null
sudo apt-get -qq install oracle-java8-set-default -y > /dev/null
echo java versions have not changed since first install
sleep 1
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