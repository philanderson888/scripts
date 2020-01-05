cls

echo "checking all repos"

rm -Force c:\users\tech-w99a\WindowsPowerShell\*
copy-item -Path c:\scripts\Windows\* -Destination c:\users\tech-w99a\WindowsPowerShell

echo ""
echo ""

echo "checking status first"



echo c-sharp >> c:/data/output.txt
cd C:\c-sharp >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
git add .
git commit -m "Updating c-sharp"
git push
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt




echo scripts >> c:/data/output.txt
cd C:\scripts >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
git add .
git commit -m "updating scripts"
git push
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt




echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "All finished updating - now double checking there are no more changes to push through" >> c:/data/output.txt
echo "=====================================================================================" >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt


echo c-sharp >> c:/data/output.txt
cd C:\c-sharp >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
git add .
git commit -m "Updating c-sharp"
git push
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt




echo scripts >> c:/data/output.txt
cd C:\scripts >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
git add .
git commit -m "updating scripts"
git push
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt



notepad C:\data\output.txt
