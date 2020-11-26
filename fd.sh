#find . -name  "*.cc" -exec grep -l -y "introduceSelf(" {} \;
echo "fd.sh file keyword"
find . -name  $1 -exec grep -l -y $2 {} \;

