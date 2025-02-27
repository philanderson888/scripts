echo "\n\n\n\n\n"
echo "========================================"
echo "========================================"
echo "====         collecting notes       ===="
echo "========================================"
echo "========================================"
echo " "
echo " "
echo "========================================"
echo "====            root path           ===="
echo "========================================"
root_path=~/github
echo "root_path=$root_path"
delete_me=~/temp/delete-me.txt
echo "delete_me=$delete_me"
echo " "
echo " "
echo "========================================"
echo "====            clean up            ===="
echo "========================================"
rm $delete_me
touch $delete_me
echo " "
echo " "
echo "========================================"
echo "====           planning             ===="
echo "========================================"
echo "\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo "====        personal planning       ====" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo copy $root_path/personal-planning/2024-12-speak-to-me.sh
echo copy $root_path/personal-planning/2024-12-speak-to-me.sh >> $delete_me
cat $root_path/personal-planning/2024-12-speak-to-me.sh >> $delete_me
echo "\n\n\n\n"
echo "========================================"
echo "====          all learning          ===="
echo "========================================"
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo "====           all learning         ====" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo copy $root_path/course-notes/random/all.md
echo copy $root_path/course-notes/random/2024-10-accounts.md
echo copy $root_path/course-notes/random/2024-worship-songs.md
echo copy $root_path/course-notes/random/2024-q2.md
echo copy $root_path/course-notes/random/2024-q3.md
echo copy $root_path/course-notes/random/2018.md
echo "\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo "====           all learning         ====" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo copy $root_path/course-notes/random/all.md >> $delete_me
echo copy $root_path/course-notes/random/2024-10-accounts.md >> $delete_me
echo copy $root_path/course-notes/random/2024-worship-songs.md >> $delete_me
echo copy $root_path/course-notes/random/2024-q2.md >> $delete_me
echo copy $root_path/course-notes/random/2024-q3.md >> $delete_me
echo copy $root_path/course-notes/random/2018.md >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n" >> $delete_me
cat $root_path/course-notes/random/all.md >> $delete_me
cat $root_path/course-notes/random/2024-10-accounts.md >> $delete_me
cat $root_path/course-notes/random/2018.md >> $delete_me



















echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================"
echo "====               Rust             ===="
echo "========================================"
echo "\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo "====               Rust 1           ====" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me

# print file names
for FILENAME in $root_path/rust/notes/*.md; do
    echo $FILENAME
    echo $FILENAME >> $delete_me
done

for FILENAME in $root_path/rust/projects/*/src/main.rs; do
    echo $FILENAME
    echo $FILENAME >> $delete_me
done

for FILENAME in $root_path/rust/projects/*/*/src/main.rs; do
    echo $FILENAME
    echo $FILENAME >> $delete_me
done

for FILENAME in $root_path/rust/projects/06-crates/*/*/*.rs; do
    echo $FILENAME
    echo $FILENAME >> $delete_me
done

for FILENAME in $root_path/rust/projects/06-crates/*/*/*/*.rs; do
    echo $FILENAME
    echo $FILENAME >> $delete_me
done

# print file contents

for FILENAME in $root_path/rust/notes/*.md; do
    echo $FILENAME >> $delete_me
    echo "" >> $delete_me
    cat $FILENAME >> $delete_me
done

for FILENAME in $root_path/rust/projects/*/src/main.rs; do
    echo $FILENAME >> $delete_me
    echo "" >> $delete_me
    cat $FILENAME >> $delete_me
done

for FILENAME in $root_path/rust/projects/*/*/src/main.rs; do
    echo $FILENAME >> $delete_me
    echo "" >> $delete_me
    cat $FILENAME >> $delete_me
done

for FILENAME in $root_path/rust/projects/06-crates/*/*/*.rs; do
    echo $FILENAME >> $delete_me
    echo "" >> $delete_me
    cat $FILENAME >> $delete_me
done


for FILENAME in $root_path/rust/projects/06-crates/*/*/*/*.rs; do
    echo $FILENAME >> $delete_me
    echo "" >> $delete_me
    cat $FILENAME >> $delete_me
done










# number of runs of this script
run_counter=$(cat .script_data/run_counter)
run_counter=$(( run_counter + 1 ))
echo there have been $run_counter runs of this script
echo store new value for next time
echo $run_counter > .script_data/run_counter

git_frequency=10
git_counter=$(($run_counter % $git_frequency))

echo running git every $git_frequency runs of this program - we are on run $git_counter ...

if [ $git_counter -eq 0 ] ; then
    
    echo ... so git is run this time ... 

    echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
    echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
    echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
    echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
    echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
    echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
    echo "========================================"
    echo "====               Git              ===="
    echo "========================================"
    echo "========================================" >> $delete_me
    echo "====              Git               ====" >> $delete_me
    echo "========================================" >> $delete_me
    echo copy $root_path/course-notes/programming/git.md
    echo copy $root_path/course-notes/programming/git.md >> $delete_me
    cat $root_path/course-notes/programming/git.md >> $delete_me

else
    echo ... so git is not run this time ...
fi









echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================"
echo "====           c# / .NET            ===="
echo "========================================"
echo copy $root_path/c-sharp/notes/01-dot-net-8-c-sharp-12.md
echo copy $root_path/c-sharp/notes/03-types.md
echo copy $root_path/c-sharp/notes/04-nullable-types.md
echo copy $root_path/c-sharp/notes/20-win-ui.md
echo copy $root_path/c-sharp/projects/01-overview/Program.cs
echo copy $root_path/c-sharp/projects/03-types/Program.cs
echo copy $root_path/c-sharp/projects/04-nullable-types/Program.cs
echo copy $root_path/c-sharp/projects/10-tuples/Program.cs
echo copy $root_path/c-sharp/README.md
echo "\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo "====           c# / .NET          ====" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo copy $root_path/c-sharp/notes/01-dot-net-8-c-sharp-12.md >> $delete_me
echo copy $root_path/c-sharp/notes/03-types.md >> $delete_me
echo copy $root_path/c-sharp/notes/04-nullable-types.md >> $delete_me
echo copy $root_path/c-sharp/notes/20-win-ui.md >> $delete_me
echo copy $root_path/c-sharp/projects/01-overview/Program.cs >> $delete_me
echo copy $root_path/c-sharp/projects/03-types/Program.cs >> $delete_me
echo copy $root_path/c-sharp/projects/04-nullable-types/Program.cs >> $delete_me
echo copy $root_path/c-sharp/projects/10-tuples/Program.cs >> $delete_me
echo copy $root_path/c-sharp/README.md >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n" >> $delete_me
cat $root_path/c-sharp/notes/01-dot-net-8-c-sharp-12.md >> $delete_me
cat $root_path/c-sharp/notes/03-types.md >> $delete_me
cat $root_path/c-sharp/notes/04-nullable-types.md >> $delete_me
cat $root_path/c-sharp/notes/20-win-ui.md >> $delete_me
cat $root_path/c-sharp/projects/01-overview/Program.cs >> $delete_me
cat $root_path/c-sharp/projects/03-types/Program.cs >> $delete_me
cat $root_path/c-sharp/projects/04-nullable-types/Program.cs >> $delete_me
cat $root_path/c-sharp/projects/10-tuples/Program.cs >> $delete_me
cat $root_path/c-sharp/README.md >> $delete_me


echo "songs on google - song index https://docs.google.com/spreadsheets/d/1ZWtHzGTwAVX6KYYc1XKJAj_t8RbUJlhOUs5NgJQHfEU/edit?gid=0#gid=0"
echo "songs on google - song index https://docs.google.com/spreadsheets/d/1ZWtHzGTwAVX6KYYc1XKJAj_t8RbUJlhOUs5NgJQHfEU/edit?gid=0#gid=0" >> $delete_me

echo "notion notes"
echo "notion notes" >> $delete_me

echo "https://www.notion.so/philanderson888/a4d7a66acde24f04a4ad44007fd22d56"
echo "https://www.notion.so/philanderson888/a4d7a66acde24f04a4ad44007fd22d56" >> $delete_me

echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >> $delete_me
echo "========================================"
echo "====        Pending deletion        ===="
echo "====        A+/Net+/Sec+/Cyber      ===="
echo "========================================"
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo "====        Pending deletion        ====" >> $delete_me
echo "====        A+/Net+/Sec+/Cyber      ====" >> $delete_me
echo "========================================" >> $delete_me
echo "========================================" >> $delete_me
echo copy $root_path/course-notes/random/all-bin.md