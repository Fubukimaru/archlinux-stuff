rm `find ~/.mail/* -type d -name 'Trash' |  sed 's/$/\/new\/*/'`
rm `find ~/.mail/* -type d -name 'Trash' |  sed 's/$/\/cur\/*/'`
