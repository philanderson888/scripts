echo "trying to push to github with a script"
cd /Users/Shared/scripts
git status
git pull
git add .
git commit -m "Updating scripts"
git push
echo "Showcase"
cd /Users/Shared/showcase
git status
git pull
git add .
git commit -m "Updating Showcase"
