#!/bin/bash

# List of websites 
websites=( 
  "www.savanamed.com" 
  "www.github.com"
	"www.stackoverflow.com"
	"www.coursera.org"
	"www.edx.org"
	"www.khanacademy.org"
	"www.skillshare.com"
	"www.udemy.com"
	"www.trello.com"
	"www.atlassian.com"
	"www.confluence.com"
	"www.basecamp.com"
	"www.asana.com"
	"www.notion.so"
	"www.evernote.com"
	"www.adobe.com"
	"www.sketchapp.com"
	"www.figma.com"
	"www.gimp.org"
	"www.photopea.com"
	"www.canva.com"
	"www.inkscape.org"
	"www.scrivenerapp.com"
	"www.evernote.com"
	"www.onenote.com"
	"www.notion.so"
	"www.pinterest.com"
	"www.behance.net"
	"www.dribble.com"
	"www.upwork.com"
	"www.fiverr.com"
	"www.freelancer.com"
	"www.indeed.com"
	"www.monster.com"
	"www.linkedin.com"
	"www.glassdoor.com"
	"www.quora.com"
	"www.medium.com"
	"www.blogger.com"
	"www.wordpress.com"
	"www.squarespace.com"
	"www.wix.com"
	"www.weebly.com"
	"www.spotify.com"
	"www.applemusic.com"
	"www.amazon.com"
	"www.netflix.com"
	"www.primevideo.com"
	"www.disneyplus.com"
	"www.hbomax.com"
	"www.twitch.tv"
	"www.pandora.com"
	"www.last.fm"
	"www.google.com"
	"www.soundcloud.com"
	"www.youtube.com"
)


# Obtain array length
length=${#websites[@]}

# Generate 10 random sites
sites=$(shuf -i 0-$length -n 10)

# Create 10 files to store the content of the index pages
for domains in $sites
do
   curl -L ${websites[$domains].index.html} > "${websites[$domains]}.html"
   echo "${websites[$domains]}"
done

# Count the number of lines matching the "href=" string
for filename in *.html
do
  count=$(grep -c "href=" "${filename}")
  echo "The file ${filename} contains ${count} matches."

  new_filename=$(echo "${filename}" | sed 's/\.html/-hrefs.txt/')
  echo "${count}" > "${new_filename}"
done

# Delete the 10 newly created result files
for textfile in *-hrefs.txt
do
  rm "${textfile}"
done

# Measure the runtime
end=$(date +%s)
runtime=$((end-start))
echo "The script ran in ${runtime} seconds."

