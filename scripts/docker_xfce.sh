#!/usr/bin/env bash

set -ex

rm -f $PWD/kickstarts/repos.txt
ln -s $PWD/kickstarts/repos-86.txt $PWD/kickstarts/repos.txt
ksflatten --config $PWD/kickstarts/almalinux-8-live-xfce.ks --output flat-xfce.ks
sed -i 's/repo --name="baseos" --base/url --/' $PWD/flat-xfce.ks &>/dev/null
sudo livemedia-creator \
    --ks=flat-xfce.ks \
    --no-virt --resultdir  ./iso-xfce \
    --project "AlmaLinux Live" \
    --make-iso \
    --iso-only \
    --iso-name almalinux-8-live-xfce.iso \
    --releasever 8.6 \
    --volid "AlmaLinux Live" \
    --nomacboot