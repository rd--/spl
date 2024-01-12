# Assignment Operator Syntax -- syntax

Rewrite rule:

- _p +:= q_ ⟹ _p := p + (q)_
- _p -:= q_ ⟹ _p := p - (q)_

and so on for all allowed operator characters.

The most common operators are + and - for incrementing and decrementing counters.

However the equery operator ? is also interesting.

The notation _p ?:= q_ initializes _p_ if it is nil, where _q_ must be a no-argument block.

	| x | x ?:= { 4 }; x = 4
	let x = 1; x ?:= { 4 }; x = 1
