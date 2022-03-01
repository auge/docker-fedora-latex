#/usr/bin/env sh

tag=$(date +"%Y-%m-%d")
echo Tag: $tag
docker build --no-cache -t steinweb/fedora-latex:$tag --pull .
docker tag steinweb/fedora-latex:$tag steinweb/fedora-latex:latest
docker push steinweb/fedora-latex:$tag
docker push steinweb/fedora-latex:latest

