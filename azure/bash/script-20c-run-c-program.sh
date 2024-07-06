echo create folder 'c' and move script-20a-hello-world.c into folder 'c'
mkdir c
mv ./script-20a-hello-world.c c
cd c
echo list files in c folder
ls
echo "================================================================="
echo "====                   compile c program                    ====="
echo "================================================================="
gcc ./script-20a-hello-world.c -o ./script-20a-hello-world-executable.c
echo "================================================================="
echo "====                    run c program                        ===="
echo "================================================================="
chmod 777 ./script-20a-hello-world-executable.c
./script-20a-hello-world-executable.c
echo
echo
echo 
