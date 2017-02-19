#!/usr/bin/env tclsh
# The - text editor
# Main module
# Written by Samadi van Koten on 2017-02-19
# This file is licensed under the MIT license

package require Tk

proc include {name} {
  # Includes a file from the current directory
  source [file join [file dirname [file normalize [info script]]] $name]
}

## GUI setup
pack [text .buf] -fill both -expand 1
focus .buf

bind . <Escape> {
  exit
}

## Configuration
include colours.tcl ;# The DSL
include colours/default.tcl ;# The colour scheme

colourscheme default

## File loading

# if {$argc > 0} {
#   set fh [open [lindex $argv 0] r]
#   .buf insert 1.0 [read $fh]
#   close $fh
# }

# Load our own source code for testing
set fh [open [info script] r]
.buf insert 1.0 [read $fh]
close $fh

