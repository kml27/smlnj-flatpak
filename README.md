# Flatpak scripts for SML/NJ

These scripts ease building a SML/NJ flatpak. Fedora (and MacOS X according to the SML/NJ 110.91 release notes) are phasing out support of the i386 libraries. While there is a build for Mac OS X (and the SML/NJ team is working on completing a port to x64), this method provides a nicer way of building on Fedora and isolating the required libraries. Flatpak seems to work fine without the overhead of a full kvm/vbox/vmware or docker/rkt install. It is also intended to be portable across different linux distros (rather than just the current package repo supported by a given flavor). It does provide a sandboxed environment, but --filesystem=host permissions are added to allow most (all) of the `use "example.sml";` usages someone might want to do from the REPL.

Local build requires:
 * flatpak
 * flatpak-builder
 * flatpak org.freedesktop.Platform/i386/18.08, org.freedesktop.Sdk/i386/18.08
 * wget

[Flatpak Docs](http://docs.flatpak.org/en/latest/index.html)  
[SML/NJ](https://www.smlnj.org/)

First run, if org.freedesktop.(Platform|Sdk)/i386/18.08 is not yet installed...

```
./install_platform.sh
```

Any time, usually after an update to SML/NJ...

```
./get_sml.sh
./build.sh
```

` flatpak run org.smlnj.sml ` will run `sml`

Other inclcuded executables can be run using the --command flag i.e.
` flatpak run --command=<bin> org.smlnj.sml <arguments-to-bin> ` 

e.g.
` flatpak run --command=heap2exec org.smlnj.sml foo.x86-unix foo ` 


Included executables are as follows:

 * asdlgen
 * ml-antlr
 * ml-burg
 * ml-makedepend
 * ml-ulex
 * sml
 * heap2exec
 * ml-build
 * ml-lex
 * ml-nlffigen
 * ml-yacc


If there is an update or specific version of the source you want to download and use, modify your local copy of `get_sml.sh` by setting `v=<version-you-want>` near the top of that file.

While this repo itself should not contain anything under the SML/NJ license at this time, I am including its license for reference. 

The original SML/NJ license is as follows:

STANDARD ML OF NEW JERSEY COPYRIGHT NOTICE, LICENSE AND DISCLAIMER.
Copyright (c) 2001-2015 by The Fellowship of SML/NJ
Copyright (c) 1989-2001 by Lucent Technologies

Permission to use, copy, modify, and distribute this software and its documentation for any purpose and without fee is hereby granted, provided that the above copyright notice appear in all copies and that both the copyright notice and this permission notice and warranty disclaimer appear in supporting documentation, and that the name of Lucent Technologies, Bell Labs or any Lucent entity not be used in advertising or publicity pertaining to distribution of the software without specific, written prior permission.

Lucent disclaims all warranties with regard to this software, including all implied warranties of merchantability and fitness. In no event shall Lucent be liable for any special, indirect or consequential damages or any damages whatsoever resulting from loss of use, data or profits, whether in an action of contract, negligence or other tortious action, arising out of or in connection with the use or performance of this software. 

