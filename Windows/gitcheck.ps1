cls

echo "checking all GitHub repositories with a push and pull on my HP laptop"

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









echo ""
echo ""
echo 2019-04-c-sharp-labs 
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
echo open-source-notes 
cd 'C:\GDrive\course-notes' 
git add . 
git commit -m "Updating open source notes" 
git push 
echo "" 
echo "" 










echo ""
echo ""
echo learn-graph-ql 
echo learn-graph-ql 
cd C:\learn-graph-ql 
git pull 
git add . 
git commit -m "Updating learn-graph-ql" 
git push 
echo "" 
echo "" 






echo ""
echo ""
echo scripts 
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
echo showcase 
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
echo "Not doing - C:\vue-with-paypal-payment - Updating vue-with-paypal-payment"






echo ""
echo ""
echo closed-source-sparta-notes 
echo closed-source-sparta-notes 
cd "C:\OneDriveSparta\OneDrive - Sparta Global Limited\notes\closed-source-sparta-notes" 
git status 
git add . 
git commit -m "Updating closed source sparta notes" 
git push 
echo "" 
echo "" 










subl c:/data/output.txt 

