#!/usr/bin/env bash
flatpak-builder --repo=repo build-dir org.smlnj.sml.json --arch=i386 --force-clean

echo example installation from 'repo'
echo flatpak --user remote-add --no-gpg-verify smlnj repo
echo flatpak --user install smlnj org.smlnj.sml
