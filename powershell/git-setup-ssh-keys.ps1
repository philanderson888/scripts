echo "Use Ninite to install your favourite programs"
pause
echo "Install GitBash"
pause
echo "Download Sublime Text 3"
pause
echo "Install Office"
pause
echo "Install Teams"
pause
echo "Add Sublime Text 3 to PATH"
pause
echo "Creating SSH keys for GitHub - uncomment all these commands first"
# ssh-keygen -t rsa -b 4096 ;
# start the ssh agent service to run in the background (Windows needs GitBash)
cd "C:\Program Files\Git\"
./git-bash.exe
echo "Manually run this command on GitBash - eval $(ssh-agent -s)" 
# add key to my account 
# ssh-add ~/.ssh/id_rsa;
# copy the key to the clipboard on Windows
# clip < ~/.ssh/id_rsa.pub;
Echo "Now login to github.com and paste the data into a new key"
echo "cd reponame..."
echo "git remote set-url origin git@github.com:username/repo.git"
echo "git push origin master"
echo "repeat for every repo"
pause
