# convert pngs to icons
for f in *                                                           
do
        echo "Processing ${f%.*}"
        png2icns ${f%.*}.png -o ${f%.*}.icns
done



# this figured out this icns thing
NOW_HOUR=$( date +"%H" )
echo $NOW_HOUR
NOW_MINUTE=$( date +"%M")
NOW_HOUR_NORMALIZED=$(($NOW_HOUR % 12))
HOUR_LENGTH=${#NOW_HOUR_NORMALIZED}
echo "${NOW_HOUR}_${HOUR_LENGTH}"
if (( 2 > HOUR_LENGTH )); then
    echo "this hour is too short"
    FILE_PATH="/Users/morrykolman/rand_git/desktop_clock/all_clocks/0${NOW_HOUR_NORMALIZED}_${NOW_MINUTE}.icns"
    fileicon set /Users/morrykolman/Desktop/clockIcon $FILE_PATH
else
    FILE_PATH="/Users/morrykolman/rand_git/desktop_clock/all_clocks/${NOW_HOUR_NORMALIZED}_${NOW_MINUTE}.icns"
    fileicon set /Users/morrykolman/Desktop/clockIcon $FILE_PATH
fi
touch /Users/morrykolman/Desktop/clockIcon
# echo "${NOW_HOUR_NORMALIZED}_${NOW_MINUTE}.icns"
# echo $FILE_PATH

# change the desktop clock folder to the time icon for the file