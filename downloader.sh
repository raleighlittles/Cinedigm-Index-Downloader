# Download the files
wget --recursive --no-parent https://newvideo.com/wp-content/uploads/

# Delete any leftover 'index' files
find . -iname "*index.html*" -delete 

# Delete files over 100 MB (Github limit) sadly
find newvideo.com -type f -size +100M -delete 

# Update the last-run.txt file
echo "$(date)" >> last-run.txt
echo "$(du -sh newvideo.com | cut -f1)" >> last-run.txt
echo "$(find newvideo.com -type f)" >> last-run.txt


# Now check in each of the files downloaded into git..
# Git doesn't have limits on the max repository size, but instead imposes limits on the
# size of each `pack`. Basically, you can't add more than 2 GB of files in each commit, even if
# those files are all under the 100 MB individual size limit..

# To get around that restriction, we'll commit each file individually.
# Some files can have spaces in them, which throws off `find` (WHY??)
# Do as a workaround, change the IFS (In file Separator) to the newline character, and then change it back when you're done.
# This breaks if your actual filenames have new lines in them.
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in $(find newvideo.com -type f)
do
    git add "$f"
    git commit -m "Added $f"
    git push origin main
done
IFS=$SAVEIFS