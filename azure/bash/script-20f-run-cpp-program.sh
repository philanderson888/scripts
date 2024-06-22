echo "================================================================="
echo "====                 create cpp folder                      ====="
echo "================================================================="
mkdir cpp
echo "================================================================="
echo "====                  move cpp files                        ====="
echo "================================================================="
mv ./script-20d-hello-world.cpp cpp
cd cpp
echo list files in cpp folder
ls
echo "================================================================="
echo "====                   compile cpp                           ===="
echo "================================================================="
g++ ./script-20d-hello-world.cpp -o ./script-20d-hello-world-executable.cpp
echo "================================================================="
echo "====                    run cpp                              ===="
echo "================================================================="
chmod 777 ./script-20d-hello-world-executable.cpp
./script-20d-hello-world-executable.cpp
