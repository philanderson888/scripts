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
echo " "
echo " "
echo "========================================"
echo "====          all learning          ===="
echo "========================================"
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
cat $root_path/course-notes/random/2024-worship-songs.md >> $delete_me
cat $root_path/course-notes/random/2024-q2.md >> $delete_me
cat $root_path/course-notes/random/2024-q3.md >> $delete_me
cat $root_path/course-notes/random/2018.md >> $delete_me
echo " "
echo " "
echo " "
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

echo " "            
echo " "
echo " "
echo " "
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