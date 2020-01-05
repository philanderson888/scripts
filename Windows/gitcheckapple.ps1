cls

echo "checking all repos"

rm -Force c:\users\apple\WindowsPowerShell\*
copy-item -Path c:\scripts\Windows\* -Destination c:\users\apple\WindowsPowerShell

echo ""
echo ""

echo "checking status first"



echo C:\scripts 
cd C:\scripts 
git status
git diff




echo C:\c-sharp 
cd C:\c-sharp 
git status
git diff



cd "c:\"


pause




cls

echo "Pushing and pulling all repos"







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
echo c-sharp 
cd C:\c-sharp 
git pull 
git add . 
git commit -m "Updating c-sharp" 
git push 
echo "" 
echo "" 



