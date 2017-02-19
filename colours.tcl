# The - text editor
# Colour scheme DSL
# Written by Samadi van Koten on 2017-02-19
# This file is licensed under the MIT license

namespace eval colourscheme-dsl {
  proc make-tag {name} {
    # Creates a command that configures a tag
    proc $name {{fg {}} {bg {}} args} "
      .buf tag configure $name -foreground \$fg -background \$bg {*}\$args
    "
  }

  # Syntax highlighting tags
  make-tag keyword
  make-tag comment
  make-tag string
  make-tag number

  rename colourscheme-dsl::make-tag {} ;# Clean up the make-tag proc

  proc default {fg bg args} {
    .buf configure -foreground $fg -background $bg {*}$args
  }

  proc cursor {bg {blink 0}} {
    if {!$blink} {
      .buf configure -insertofftime 0
    }
    .buf configure -insertbackground $bg
  }
}

proc colourscheme {name {body {}}} {
  # Create or activate a colour scheme
  global colourschemes
  if {$body == {}} {
    namespace eval colourscheme-dsl $colourschemes($name)
  } else {
    set colourschemes($name) $body
  }
}

