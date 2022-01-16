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