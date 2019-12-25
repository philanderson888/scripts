printf "\n\n\n\n\n==checking scripts\n"
cd /Users/Shared/scripts
git status

pause


printf "\n\n\n\n\n==updating scripts\n"
cd /Users/Shared/scripts
git pull
git add .
git commit -m "Updating scripts"
git push


echo "Updating blog"
cd /Users/Shared/blog
git status
git pull
git add .
git commit -m "Updating contentful blog"
git push
echo "";


echo "Updating bootstrap"
cd /Users/Shared/bootstrap
git status
git pull
git add .
git commit -m "Updating bootstrap"
git push
echo "";




printf "\n\n\n\n\n==updating c-sharp-console-core\n"
cd /Users/Shared/c-sharp-console-core
git status
git pull
git add .
git commit -m "Updating c-sharp-console-core"
git push




echo "Updating open source course-notes on Google Drive"
cd "/Users/apple/Google Drive/course-notes"
git status
git pull
git add .
git commit -m "Updating course-notes"
git push
echo "";




echo "Updating notes"
cd /Users/Shared/notes
git status
git pull
git add .
git commit -m "Updating notes"
git push
echo "";




echo "Updating python"
cd /Users/Shared/python
git status
git pull
git add .
git commit -m "Updating python"
git push
echo "";






echo "shells"
cd /Users/Shared/shells
git status
git pull
git add .
git commit -m "Updating Shells"
git push
echo ""


echo "Showcase"
cd /Users/Shared/showcase
git status
git pull
git add .
git commit -m "Updating Showcase"
git push
echo "";



echo "Updating vue"
cd /Users/Shared/vue
git status
git pull
git add .
git commit -m "Updating Vue"
git push
echo "";


echo "Updating vue-with-paypal-payment"
cd /Users/Shared/vue-with-paypal-payment
git status
git pull
git add .
git commit -m "Updating Vue With Paypal Payment"
git push
echo "";


