#!/usr/bin/env tclsh
# The - text editor
# Written by Samadi van Koten on 2017-02-19
# This file is licensed under the MIT license

package require Tk

pack [text .buf] -fill both -expand 1
focus .buf

if {$argc > 0} {
  set fh [open [lindex $argv 0] r]
  .buf insert 1.0 [read $fh]
  close $fh
}

bind . <Escape> {
  puts -nonewline [.buf get 1.0 end]
  exit
}

