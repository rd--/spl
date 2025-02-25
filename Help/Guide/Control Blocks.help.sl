# Control Blocks

Control structures are ordinary blocks, as in Smalltalk.

Evaluation of the arguments to `do`, `if`, `timesRepeat`, `whileTrue` &etc.
must be delayed manually.

The notation to delay the evaluation of a value _x_ is _{ x }_.

`Trailing Block Syntax` allows control structures to be written concisely,
as _p.if { q } { r }_,
and _{ p }.whileTrue { q }_.

* * *

See also: do, caseOf, if, timesRepeat, which, whileTrue

Guides: Trailing Block Syntax
