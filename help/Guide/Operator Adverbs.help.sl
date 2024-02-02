# Operator Adverbs -- syntax

Adverbs are methods at _Block_.
Adverbs modify how operators iterate over sequences.
Adverbs are present in the J programming language, which is a successor of Apl.

An adverb _a_ is applied to an operator _o_ using the notation _o.a_.

The library defines the following adverbs, which are all mnemonics:

- _e_: equal, operands must be of equal size else an error is signalled (usual Smalltalk rule)
- _s_: small, the larger operand is truncated to the size of the smaller (usual Lisp rule)
- _w_: wrap, the smaller operand is extended by wrapped indexing (usual SuperCollider rule)
- _f_: fold, the smaller operand is extended by folded indexing
- _x_: cross, each item from the left is applied pointwise with the right (the Hakell list monad)
- _t_: table, answers a matrix the row order vector of which is equal to cross

The _t_ adverb is the only form that changes the shape of the input sequence.

	[1 2 3] +.e [4 5 6] = [5 7 9]
	[1 2 3] +.s [4 5 6 7] = [5 7 9]
	[1 2 3] +.w [4 5 6 7] = [5 7 9 8]
	[1 2 3] +.f [4 5 6 7] = [5 7 9 9]
	[1 2 3] +.x [4 5 6] = [5 6 7 6 7 8 7 8 9]
	[1 2 3] +.t [4 5 6] = [5 6 7; 6 7 8; 7 8 9]
