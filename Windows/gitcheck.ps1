﻿copy -Force C:\Users\TECH-W99a\WindowsPowerShell\gitcheck.ps1 C:\scripts\Windows
copy -Force C:\Users\TECH-W99a\WindowsPowerShell\gitpush.ps1 C:\scripts\Windows
copy -Force C:\Users\TECH-W99a\WindowsPowerShell\gitsetup.ps1 C:\scripts\Windows
copy -Force C:\Users\TECH-W99a\WindowsPowerShell\test.ps1 C:\scripts\Windows

echo "" > c:/data/output.txt
echo "" >> c:/data/output.txt

echo 2019-06-c-sharp-labs >> c:/data/output.txt
cd C:\2019-06-c-sharp-labs >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt

echo 2019-04-c-sharp-labs >> c:/data/output.txt
cd C:\2019-04-c-sharp-labs >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt

echo bootstrap >> c:/data/output.txt
cd C:\bootstrap >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt

echo c-sharp >> c:/data/output.txt
cd C:\c-sharp >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt

echo cyber >> c:/data/output.txt
cd C:\cyber >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt

echo scripts >> c:/data/output.txt
cd C:\scripts >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt

echo vue >> c:/data/output.txt
cd c:\vue >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt


echo closed-source-sparta-notes >> c:/data/output.txt
cd 'C:\OneDriveSparta\OneDrive - Sparta Global Limited\notes\closed-source-sparta-notes' >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
echo "" >> c:/data/output.txt
echo "" >> c:/data/output.txt

echo open-source-notes >> c:/data/output.txt
cd 'C:\OneDriveSparta\OneDrive - Sparta Global Limited\notes\open-source-notes' >> c:/data/output.txt
git pull >> c:/data/output.txt
git status >> c:/data/output.txt
subl c:/data/output.txt