temp=`mktemp`
for f in $@ ; do
    t=`stat -c %Y $f`
    d=`date -d @$t +'%Y-%m-%d %H:%M:%S %z'`
    p=../_posts/`date -d @$t +'%Y-%m-%d-'``basename $f`
    mv $f $p
    awk -f date_post.awk date="$d" overwrite=1 $p > $temp
    touch -r $p $temp
    mv -bf $temp $p
done
