clear && printf '\e[3J'

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

printf "\n\n\n\n\n==checking c-sharp\n"
cd /Users/Shared/c-sharp
git status

printf "\n\n\n\n\n==checking c-sharp-console-core\n"
cd /Users/Shared/c-sharp-console-core
git status

printf "\n\n\n\n\nchecking course-notes\n"
cd "/Users/apple/Google Drive/course-notes"
git status

printf "\n\n\n\n\nchecking notes\n"
cd /Users/Shared/notes
git status

printf "\n\n\n\n\nchecking python\n"
cd /Users/Shared/python
git status

printf "\n\n\n\n\nchecking personal (which is a private repo)\n"
cd /Users/Shared/personal
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



printf "\n\n\n\n Press Escape To Abort Or Enter To Continue . . . \n\n"
read -n1 -r -p "" key
    

if [ "$key" = '' ]; then
    # Continue with PUSH to GITHUB
    printf "\n\n\n\n\n==updating scripts\n"
	cd /Users/Shared/scripts
	git pull
	git add .
	git commit -m "Updating scripts"
	git push


	printf "\n\n\n\n\n==Updating contentful blog\n"
	cd /Users/Shared/blog
	git pull
	git add .
	git commit -m "Updating contentful blog"
	git push


	printf "\n\n\n\n\n==Updating bootstrap\n"
	cd /Users/Shared/bootstrap
	git pull
	git add .
	git commit -m "Updating bootstrap"
	git push

	printf "\n\n\n\n\n==updating c-sharp\n"
	cd /Users/Shared/c-sharp
	git pull
	git add .
	git commit -m "Updating c-sharp"
	git push

	printf "\n\n\n\n\n==updating c-sharp-console-core\n"
	cd /Users/Shared/c-sharp-console-core
	git pull
	git add .
	git commit -m "Updating c-sharp-console-core"
	git push

	printf "\n\n\n\n\n==Updating course-notes\n"
	cd "/Users/apple/Google Drive/course-notes"
	git pull
	git add .
	git commit -m "Updating course-notes"
	git push

	printf "\n\n\n\n\n==Updating notes\n"
	cd /Users/Shared/notes
	git pull
	git add .
	git commit -m "Updating notes"
	git push
	

	printf "\n\n\n\n\n==Updating personal\n"
    cd /Users/Shared/personal
    git pull
    git add .
    git commit -m "Updating personal"
    git push

	printf "\n\n\n\n\n==Updating python\n"
	cd /Users/Shared/python
	git pull
	git add .
	git commit -m "Updating python"
	git push

	printf "\n\n\n\n\n==Updating shells\n"
	cd /Users/Shared/shells
	git pull
	git add .
	git commit -m "Updating Shells"
	git push

	printf "\n\n\n\n\n==Updating showcase\n"
	cd /Users/Shared/showcase
	git pull
	git add .
	git commit -m "Updating Showcase"
	git push

	printf "\n\n\n\n\n==Updating vue\n"
	cd /Users/Shared/vue
	git pull
	git add .
	git commit -m "Updating Vue"
	git push

	printf "\n\n\n\n\n==Updating vue-with-paypal-payment\n"
	cd /Users/Shared/vue-with-paypal-payment
	git pull
	git add .
	git commit -m "Updating Vue With Paypal Payment"
	git push

	printf "\n\n\n\n\nGit Push And Pull Complete For All Repos\n\n\n\n"

else
    # ABORT UPDATE
    printf "\n\n= = update aborted = = \n\n\n"
fi
