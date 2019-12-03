cd ~/Downloads/videos
echo 'Enter Wistia Video Embed Code:'
read CODE
ID=$(echo $CODE | cut -d'=' -f 3)
ID=$(echo $ID | cut -d'"' -f 1)
URL="https://fast.wistia.net/embed/iframe/"$ID"?videoFoam=true"
SOURCE=$(wget -qO- $URL | cat)
SOURCE=$(echo "$SOURCE" | grep -o '"url":"https://embed-ssl.wistia.com[^[:blank:]]*')
SOURCE=$(echo $SOURCE | cut -d',' -f 1)
SOURCE=$(echo $SOURCE | cut -d'"' -f 4)
EXT="mp4"
SOURCE=$(echo ${SOURCE//bin/$EXT})
wget $SOURCE