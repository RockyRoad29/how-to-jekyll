 temp=`mktemp`
 for f in ../_posts/* ; do
   t=`stat -c %Y $f`
   d=`date -d @$t +'%Y-%m-%d %H:%M:%S %z'`
   awk -f date_post.awk date="$d" $f > $temp
   touch -r $f $temp
   mv -bf $temp $f
 done
