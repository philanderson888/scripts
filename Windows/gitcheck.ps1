cls

echo "checking 16 repos"

rm -Force c:\users\tech-w99a\WindowsPowerShell\*
copy-item -Path c:\scripts\Windows\* -Destination c:\users\tech-w99a\WindowsPowerShell

echo ""
echo ""

echo "checking status first"

echo C:\scripts 
cd C:\scripts 
git status
git diff

echo C:\2019-04-c-sharp-labs 
cd C:\2019-04-c-sharp-labs 
git status
git diff

echo C:\2019-06-c-sharp-labs 
cd C:\2019-06-c-sharp-labs 
git status
git diff

echo C:\2019-09-c-sharp-labs 
cd C:\2019-09-c-sharp-labs 
git status
git diff

echo C:\2019-11-c-sharp-labs 
cd C:\2019-11-c-sharp-labs 
git status
git diff

echo C:\2019-12_CSharpWalkthrough 
cd C:\2019-12_CSharpWalkthrough 
git status
git diff

echo C:\bootstrap
cd C:\bootstrap
git status
git diff

echo C:\c-sharp 
cd C:\c-sharp 
git status
git diff

echo C:\c-sharp-tests 
cd C:\c-sharp-tests 
git status
git diff

echo c:\course-notes
cd c:\course-notes
git status
git diff

echo C:\cyber
cd C:\cyber 
git status
git diff

echo C:\shells
cd C:\shells 
git status
git diff


echo C:\showcase 
cd C:\showcase 
git status
git diff

echo c:\vue 
cd c:\vue 
git status
git diff

echo c:\vue-live 
cd c:\vue-live 
git status
git diff

echo "C:\OneDriveSparta\OneDrive - Sparta Global Limited\notes\closed-source-sparta-notes" 
cd "C:\OneDriveSparta\OneDrive - Sparta Global Limited\notes\closed-source-sparta-notes" 
git status
git diff

cd "c:\"


pause





cls

echo "Pushing and pulling to 16 repos"


echo ""
echo ""
echo scripts 
cd C:\scripts 
git pull 
git add . 
git commit -m "Updating scripts" 
git push 
echo "" 
echo "" 





echo ""
echo ""
echo 2019-04-c-sharp-labs 
cd C:\2019-04-c-sharp-labs 
git pull 
git add . 
git commit -m "Updating 2019-04-labs" 
git push 
echo "" 
echo "" 






echo ""
echo ""
echo 2019-06-c-sharp-labs 
cd C:\2019-06-c-sharp-labs 
git pull 
git add . 
git commit -m "Updating 2019-06-labs" 
git push 
echo "" 
echo "" 









echo ""
echo ""
echo 2019-09-c-sharp-labs 
cd C:\2019-09-c-sharp-labs 
git pull 
git add . 
git commit -m "Updating 2019-09-labs" 
git push 
echo "" 
echo "" 







echo ""
echo ""
echo 2019-11-c-sharp-labs 
cd C:\2019-11-c-sharp-labs 
git pull 
git add . 
git commit -m "Updating 2019-11-labs" 
git push 
echo "" 
echo "" 





echo ""
echo ""
echo 2019-12_CSharpWalkthrough 
cd C:\2019-12_CSharpWalkthrough 
git pull 
git add . 
git commit -m "Updating CSharpWalkthrough" 
git push 
echo "" 
echo "" 






echo ""
echo ""
echo bootstrap 
cd C:\bootstrap 
git pull 
git add . 
git commit -m "Updating bootstrap" 
git push 
echo "" 
echo "" 





echo ""
echo ""
echo c-sharp 
cd C:\c-sharp 
git pull 
git add . 
git commit -m "Updating c-sharp" 
git push 
echo "" 
echo "" 










echo ""
echo ""
echo c-sharp-tests 
cd C:\c-sharp-tests 
git pull 
git add . 
git commit -m "Updating c-sharp-tests" 
git push 
echo "" 
echo "" 













echo ""
echo ""
echo course-notes 
cd c:\course-notes
git add . 
git commit -m "updating course-notes" 
git push 
echo "" 
echo "" 



echo ""
echo ""
echo cyber
cd c:\cyber
git add . 
git commit -m "updating cyber" 
git push 
echo "" 
echo "" 




echo ""
echo ""
echo shells
cd c:\shells
git add . 
git commit -m "updating shells" 
git push 
echo "" 
echo "" 






echo ""
echo ""
echo showcase 
cd C:\showcase 
git pull 
git add . 
git commit -m "Updating showcase" 
git push 
echo "" 
echo "" 






echo ""
echo ""
echo vue 
cd c:\vue 
git pull 
git add . 
git commit -m "Updating vue" 
git push 
echo "" 
echo "" 






echo ""
echo ""
echo vue-live 
cd c:\vue-live 
git pull 
git add . 
git commit -m "Updating vue-live" 
git push 
echo "" 
echo "" 










echo ""
echo ""
echo closed-source-sparta-notes 
cd "C:\OneDriveSparta\OneDrive - Sparta Global Limited\notes\closed-source-sparta-notes" 
git status 
git add . 
git commit -m "Updating closed source sparta notes" 
git push 
echo "" 
echo "" 







cd c:\

