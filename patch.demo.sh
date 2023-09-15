# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
#
# examples:
# ./patch.demo.sh | jq .[0].contents | jq .[0].contents | jq .[].name
# ./patch.demo.sh | jq -c
#
function tre() {
	## tree -aC -I '' --dirsfirst "$@" | less -FRNX;
	## tree -aC -I '' --dirsfirst "$@";
	## tree -faCR -I '' --dirsfirst .gnostr | tr -d "|--" | tr -d "\`"
    FILES=$(tree --noreport -faCRJ -I '.DS_Store' --dirsfirst .gnostr | tr -d "|--" | tr -d "\`")
    ## echo $FILES
    for f in $FILES; do
        [ -L "${f%/}" ] && continue
            echo $f;
    done
}
function gnostr-list-patches(){

PATCHES=$(ls .gnostr/patches/*.json)

}
## for d in .*/ ; do
##     [ -L "${d%/}" ] && continue
##     echo "$d"
## done
for td in .gnostr/ ; do
    [ -L "${td%/}" ] && continue
    ## echo "td=$td"
    for d in $td ; do
        [ -L "${d%/}" ] && continue
        ## echo "d=$d"
        ## tre $d
        gnostr-list-patches
        for f in $PATCHES; do

            git apply --allow-empty  <(cat $f)
            gnostr-legit . -p 00000 -m "$(date +%s)/$(pwd | grep -o "[^/]*$")" | gnostr-relays | $(grep "OK" || echo 'working...')

        done
    done

done
## for d in .gnostr/ ; do
##     [ -L "${d%/}" ] && continue
##     echo "$d"
##         for file in d
##         do
##             echo $file
##             for ((i = 0; i < 3; i++))
##             do
##                 name=${file##*/}
##                 echo ${file##*/}
##                 base=${name%.txt}
##                 echo ${name%.txt}
##             done
##         done
## done
exit
gnostr-git apply \
    --ignore-whitespace \
    --ignore-space-change \
    --allow-empty \
    --allow-overlap -Nv \
    --inaccurate-eof \
    --reverse \
    --recount \
    --cached \
    --exclude README.md \
    --exclude .gnostr/config.json \
    <(cat .gnostr/patches/* | jq -rM .content)
