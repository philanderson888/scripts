echo "================================================================="
echo "====                           compile c program 2              ==========="
echo "================================================================="
cat ./script-20a-hello-world.c
gcc ./script-20a-hello-world.c -o ./script-20a-hello-world-executable.c
echo "================================================================="
echo "====                             run c program   2            ==========="
echo "================================================================="
chmod 777 ./script-20a-hello-world-executable.c
echo c program about to be run
./script-20a-hello-world-executable.c
echo c program has been run
c_installed=true
