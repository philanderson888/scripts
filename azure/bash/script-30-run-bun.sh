
#echo "======================================================================="
#echo "====                     curl bun 25190                            ===="
#echo "======================================================================="
#cd ~
#echo mkdir bun25190
#mkdir bun25190
#echo
#echo
#echo
#echo cd bun25190
#cd bun25190
#echo
#echo
#echo
#echo curl - f s S L https://bun.sh/install 
#curl -fsSL https://bun.sh/install | bash
#echo
#echo
#echo
#touch ~/.bashrc
#echo 'BUN_INSTALL="/home/azureuser/.bun"' >> ~/.bashrc
#echo 'PATH="$BUN_INSTALL/bin:$PATH"' >> ~/.bashrc
#echo
#echo
#echo
#echo source ~/.bashrc
#source ~/.bashrc
#echo
#echo
#echo
#echo not sure why bun is not installed 
#echo bun v
#bun -v
#echo bun version
#bun --version
#node -e "console.log('bun version ' + Bun.version);"
#node -e "console.log('bun version ' + Bun.revision);"
#echo "======================================================================="
#echo "====                 install bun complete 25190                    ===="
#echo "======================================================================="
