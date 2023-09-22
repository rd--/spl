# Control Procedures

Control structures are ordinary procedures, as in Smalltalk.

Evaluation of the arguments to _if_, _whileTrue_, _timesRepeat_ &etc. must be delayed manually.

The notation to delay the evaluation of a value _x_ is _{ x }_.

[Trailing Procedure Syntax] allows control structures to be written as _p.if { q } { r }_ and _{ p }.whileTrue { q }_.
