printf "\n\nChecking First All GitHub Repos For Potential Changes To Push"

printf "\n\n\n\n\n==checking scripts\n"
cd /Users/Shared/scripts
git status

printf "\n\n\n\n\nchecking blog\n"
cd /Users/Shared/blog
git status

printf "\n\n\n\n\nchecking bootstrap\n"
cd /Users/Shared/bootstrap
git status

printf "\n\n\n\n\n==checking c-sharp-console-core\n"
cd /Users/Shared/c-sharp-console-core
git status

printf "\n\n\n\n\nchecking open source course-notes on Google Drive\n"
cd "/Users/apple/Google Drive/course-notes"
git status

printf "\n\n\n\n\nchecking notes\n"
cd /Users/Shared/notes
git status

printf "\n\n\n\n\nchecking python\n"
cd /Users/Shared/python
git status

printf "\n\n\n\n\nchecking shells\n"
cd /Users/Shared/shells
git status

printf "\n\n\n\n\nchecking Showcase\n"
cd /Users/Shared/showcase
git status

printf "\n\n\n\n\nchecking vue\n"
cd /Users/Shared/vue
git status

printf "\n\n\n\n\nchecking vue-with-paypal-payment\n"
cd /Users/Shared/vue-with-paypal-payment
git status



printf "\n\n\n\n Press Escape To Abort Or Space To Continue . . . \n\n"
read -n1 -r -p "" key
    

if [ "$key" = '' ]; then
    # Continue with PUSH to GITHUB
    printf "\n\n\n\n\n==updating scripts\n"
	cd /Users/Shared/scripts
	git pull
	git add .
	git commit -m "Updating scripts"
	git push


	echo "Updating blog"
	cd /Users/Shared/blog
	git pull
	git add .
	git commit -m "Updating contentful blog"
	git push
	echo "";


	echo "Updating bootstrap"
	cd /Users/Shared/bootstrap
	git pull
	git add .
	git commit -m "Updating bootstrap"
	git push
	echo "";




	printf "\n\n\n\n\n==updating c-sharp-console-core\n"
	cd /Users/Shared/c-sharp-console-core
	git pull
	git add .
	git commit -m "Updating c-sharp-console-core"
	git push




	echo "Updating open source course-notes on Google Drive"
	cd "/Users/apple/Google Drive/course-notes"
	git pull
	git add .
	git commit -m "Updating course-notes"
	git push
	echo "";




	echo "Updating notes"
	cd /Users/Shared/notes
	git pull
	git add .
	git commit -m "Updating notes"
	git push
	echo "";




	echo "Updating python"
	cd /Users/Shared/python
	git pull
	git add .
	git commit -m "Updating python"
	git push
	echo "";






	echo "shells"
	cd /Users/Shared/shells
	git pull
	git add .
	git commit -m "Updating Shells"
	git push
	echo ""


	echo "Showcase"
	cd /Users/Shared/showcase
	git pull
	git add .
	git commit -m "Updating Showcase"
	git push
	echo "";



	echo "Updating vue"
	cd /Users/Shared/vue
	git pull
	git add .
	git commit -m "Updating Vue"
	git push
	echo "";


	echo "Updating vue-with-paypal-payment"
	cd /Users/Shared/vue-with-paypal-payment
	git pull
	git add .
	git commit -m "Updating Vue With Paypal Payment"
	git push
	echo "";

else
    # ABORT UPDATE
    printf "\n\n= = update aborted = = \n\n\n"
fi