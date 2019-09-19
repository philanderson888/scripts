echo "trying to push to github with a script"
cd /Users/Shared/scripts
git status
sudo git pull
sudo git add .
sudo git commit -m "Updating scripts"
sudo git push
