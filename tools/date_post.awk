# example usage:
# temp=`mktemp`
# for f in _posts/*.md ; do
#   t=`stat -c %Y $f`
#   d=`date -d @$t +'%Y-%m-%d %H:%M:%S %z'`
#   awk -f date_post.awk date="$d" $f > $temp
#   touch -r $f $temp
#   mv $temp $f
# done

BEGIN {
    date_set=0;
}
/^---/ {
    if (!fm) {
        at_fm_start();
        fm = "active";
    } else if (fm=="active") {
        at_fm_end();
        fm = "done";
    }
}

fm=="active" && /date:/ {
    if (overwrite) {
        next;                   # skip printing
    } else {
        date_set=1;             # prevent date inserting
    }
}
{
    print;
}

function at_fm_start() {

}

function at_fm_end() {
    if (!date_set) {
        print "date: " date;
    }
}
