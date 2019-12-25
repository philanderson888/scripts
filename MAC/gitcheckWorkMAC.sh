printf "\n\n\n\n\n==checking scripts\n"
cd /Users/Shared/scripts
git status

printf "\n\n\n\n\n==checking c-sharp\n"
cd /Users/Shared/c-sharp
git status

printf "\n\n\n\n\n==checking c-sharp-tests\n"
cd /Users/Shared/c-sharp-tests
git status

printf "\n\n\n\n\n==checking 2019-04-c-sharp-labs\n"
cd /Users/Shared/2019-04-c-sharp-labs
git status

printf "\n\n\n\n\n==checking 2019-06-c-sharp-labs\n"
cd /Users/Shared/2019-06-c-sharp-labs
git status

printf "\n\n\n\n\n==checking 2019-09-c-sharp-labs\n"
cd /Users/Shared/2019-09-c-sharp-labs
git status


printf "\n\n\n\n\n==checking 2019-11-c-sharp-labs\n"
cd /Users/Shared/2019-11-c-sharp-labs
git status

printf "\n\n\n\n\n==checking /Users/Shared/GoogleDrive/course-notes\n"
cd "/Users/Shared/GoogleDrive/course-notes"
git status

printf "\n\n\n\n\n==checking Showcase\n"
cd /Users/Shared/showcase
git status

printf "\n\n\n\n\n==checking vue\n"
cd /Users/Shared/vue
git status







read -n1 -r -p "Press ENTER or SPACE to PUSH CHANGES, or ESCAPE to ABORT ..." key


echo [$key] is empty when SPACE is pressed # uncomment to trace
    

if [ "$key" = '' ]; then
    # Continue with PUSH to GITHUB



	printf "\n\n\n\n\n==Updating scripts\n"
	cd /Users/Shared/scripts
	git status
	git pull
	git add .
	git commit -m "Updating scripts"
	git push






	printf "\n\n\n\n\n==updating c-sharp\n"
	cd /Users/Shared/c-sharp
	git status
	git pull
	git add .
	git commit -m "Updating c-sharp"
	git push







	printf "\n\n\n\n\n==updating c-sharp-tests\n"
	cd /Users/Shared/c-sharp-tests
	git status
	git pull
	git add .
	git commit -m "Updating c-sharp-tests"
	git push







	printf "\n\n\n\n\n==updating 2019-04-c-sharp-labs\n"
	cd /Users/Shared/2019-04-c-sharp-labs
	git status
	git pull
	git add .
	git commit -m "Updating 2019-04-c-sharp-labs"
	git push






	printf "\n\n\n\n\n==updating 2019-06-c-sharp-labs\n"
	cd /Users/Shared/2019-06-c-sharp-labs
	git status
	git pull
	git add .
	git commit -m "Updating 2019-06-c-sharp-labs"
	git push






	printf "\n\n\n\n\n==updating 2019-09-c-sharp-labs\n"
	cd /Users/Shared/2019-09-c-sharp-labs
	git status
	git pull
	git add .
	git commit -m "Updating 2019-09-c-sharp-labs"
	git push








	printf "\n\n\n\n\n==updating 2019-11-c-sharp-labs\n"
	cd /Users/Shared/2019-11-c-sharp-labs
	git status
	git pull
	git add .
	git commit -m "Updating 2019-11-c-sharp-labs"
	git push









	printf "\n\n\n\n\n==Updating /Users/Shared/GoogleDrive/course-notes\n"
	cd "/Users/Shared/GoogleDrive/course-notes"
	git status
	git pull
	git add .
	git commit -m "Updating course-notes"
	git push









	printf "\n\n\n\n\n==Showcase\n"
	cd /Users/Shared/showcase
	git status
	git pull
	git add .
	git commit -m "Updating Showcase"
	git push








	printf "\n\n\n\n\n==Updating vue\n"
	cd /Users/Shared/vue
	git status
	git pull
	git add .
	git commit -m "Updating Vue"
	git push
	printf "\n\n\n\n\nGit Push And Pull Complete For All Repos\n\n\n\n"


















else
    # ABORT UPDATE
    printf "\n\n= = update aborted = = \n\n\n"
fi

