FILEPATH=`fzf`
if [ $? -eq 0 ]; then
    DIRECTORY=`echo $FILEPATH | awk -F"/[^/]*$" '{print $1}'`
    DIRECTORY=`echo $DIRECTORY | sed 's/ /\\ /g'`
    FILENAME=`echo $FILEPATH | awk -F"/" '{print $NF}'`
    echo "Directory - $DIRECTORY"
    echo "Requested file - $FILENAME"
    cd "$DIRECTORY"
    pwd
    open "$FILENAME"
else
    echo "Cancelled"
fi
