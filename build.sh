#/usr/bin/env sh

# docker user & image name
username=steinweb
image=fedora-latex

l=latest
tag=$(date +"%Y-%m-%d")
echo Tag: $tag

docker buildx build \
--push \
--pull \
--platform linux/arm64/v8,linux/amd64 \
--tag $username/$image:$tag \
--tag $username/$image:$l \
.
