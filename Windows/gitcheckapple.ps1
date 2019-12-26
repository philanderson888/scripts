copy -Force C:\Users\apple\WindowsPowerShell\gitcheck.ps1 C:\scripts\Windows
copy -Force C:\Users\apple\WindowsPowerShell\gitcheckapple.ps1 C:\scripts\Windows
copy -Force C:\Users\apple\WindowsPowerShell\gitpush.ps1 C:\scripts\Windows
copy -Force C:\Users\apple\WindowsPowerShell\gitsetup.ps1 C:\scripts\Windows
copy -Force C:\Users\apple\WindowsPowerShell\test.ps1 C:\scripts\Windows

echo "" > c:/data/output.txt
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
