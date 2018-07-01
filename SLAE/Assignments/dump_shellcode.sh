#!/bin/bash

#Author: Shawn Crivello

#Derived from https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump

#This script is used to dump the shellcode of an input file. No error checking is performed.

#Usage: ./dump_shellcode.sh filename

echo '[+] Dumping shellcode ... '

objdump -d ./$1|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'

echo '[+] Done!'
