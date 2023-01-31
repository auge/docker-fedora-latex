#/usr/bin/env sh

l=latest
tag=$(date +"%Y-%m-%d")
m=$(uname -m)
if [ $m != x86_64 ]; then
    tag=$tag-$m
    l=$l-$m
fi
echo Tag: $tag
docker build --no-cache -t steinweb/fedora-latex:$tag --pull .
docker tag steinweb/fedora-latex:$tag steinweb/fedora-latex:$l
docker push steinweb/fedora-latex:$tag
docker push steinweb/fedora-latex:$l
