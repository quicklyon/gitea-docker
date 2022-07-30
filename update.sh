#!/bin/bash

set -Eeuo pipefail
set -x

COS_PATH="cos://pkg-1308438674/files/stacksmith"
REPO_URL="https://api.github.com/repos/go-gitea/gitea/releases/latest"

LATEST_VER=$( curl -s -L $REPO_URL | jq -r .tag_name | sed 's/^v//')
CURRENT_VER=$( cat VERSION)

repack() {
  local ver=${1:?version is error.}
  local base_name="gitea-$ver-linux-amd64"

  [ ! -d /tmp/"$ver" ] && mkdir /tmp/"$ver" -pv

  wget -O /tmp/"$ver"/"${base_name}.xz"  https://github.com/go-gitea/gitea/releases/download/v${ver}/"${base_name}.xz" \
  && cd /tmp/"$ver" \
  && xz -d "${base_name}.xz" \
  && mkdir -pv apps/gitea/bin \
  && mv "$base_name" apps/gitea/bin/gitea \
  && chmod +x apps/gitea/bin/gitea \
  && upx -9 apps/gitea/bin/gitea \
  && tar czvf gitea-"$ver"-debian-11-amd64.tar.gz apps \
  && upload_to_cos "gitea-$ver-debian-11-amd64.tar.gz" \
  && cd ../ \
  && rm -rf "$ver"
}

upload_to_cos() {

  local filename=${1:?filename is missing.}
  local sha_file=${filename}.sha256

  if [ "$filename" == "" ];then
    echo "$0 need file to upload"
    exit 1
  else
    # create sha256sum file
    echo "Create sha256 file: $sha_file"
    sha256sum "$filename" > "$sha_file"

    echo "Upload $filename..."
    coscli cp "$filename" ${COS_PATH}/"$filename"

    echo "Upload $sha_file..."
    coscli cp "$sha_file" ${COS_PATH}/"$sha_file"
  fi

}

#======== Main ==========
if [ "$LATEST_VER" != "$CURRENT_VER" ];then
  echo "$LATEST_VER" > VERSION
  echo "New version was detected. repack gitea."
  repack "$LATEST_VER"
  echo "Gitea new version->$LATEST_VER was detected. Please rebuild the image."
else
  echo "$CURRENT_VER is the latest version."
fi
