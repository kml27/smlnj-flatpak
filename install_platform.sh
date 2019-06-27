#!/usr/bin/env bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.freedesktop.Platform/i386/18.08 org.freedesktop.Sdk/i386/18.08