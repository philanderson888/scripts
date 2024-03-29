echo
echo
echo
echo "==========================================
echo "====      learn linux bash scripting   =====
echo "==========================================
echo
echo
echo
echo create an array
array=( one two three )
echo
echo
echo
echo print an array
printf "%s\n" "${array[@]}"
echo
echo
echo
echo print individual items from an array
printf "Group file in Linux or Unix: %s\n" "${array[1]}"
echo
echo
echo
echo iterate over array
for item in "${!array[@]}"
do
  echo "array item is ... $item"
done