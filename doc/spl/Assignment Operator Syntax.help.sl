# Assignment Operator Syntax -- syntax

Rewrite rule:

- _p +:= q_ ⟹ _p := p + (q)_
- _p -:= q_ ⟹ _p := p - (q)_

and so on for all allowed operator characters.

The most common cases are incrementing and decrementing counters.

The notation _p ?:= q_ initializes _p_ if it is nil, where _q_ must be a no-argument block.
