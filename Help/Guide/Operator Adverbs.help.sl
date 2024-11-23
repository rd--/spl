# Operator Adverbs

Adverbs are methods at _Block_.

Adverbs modify how operators iterate over sequences.

Adverbs are present in the J programming language, which is a successor of Apl.

An adverb _a_ is applied to an operator _o_ using the notation _o.a_.

The library defines the following adverbs, which are all mnemonics:

- _e_: equal, operands must be of equal size else an error is signalled (usual Smalltalk rule)
- _s_: small, the larger operand is truncated to the size of the smaller (usual Lisp rule)
- _w_: wrap, the smaller operand is extended by wrapped indexing (usual R, S and SuperCollider rule)
- _f_: fold, the smaller operand is extended by folded indexing
- _x_: cross, each item from the left is applied pointwise with the right (the Hakell list monad)
- _t_: table, answers a matrix the row order vector of which is equal to cross

The _t_ adverb is the only form that changes the shape of the input sequence.

```
>>> [1 2 3] +.e [4 5 6]
[5 7 9]

>>> ['1' '2' '3'] ++.e ['4' '5' '6']
['14' '25' '36']

>>> [1 2 3] +.s [4 5 6 7]
[5 7 9]

>>> [1 2 3] +.w [4 5 6 7]
[5 7 9 8]

>>> [1 2 3] +.f [4 5 6 7]
[5 7 9 9]

>>> [1 2 3] +.x [4 5 6]
[5 6 7 6 7 8 7 8 9]

>>> [1 2 3] +.t [4 5 6]
[5 6 7; 6 7 8; 7 8 9]
```

# J

To start, note that _verbs_ (i.e. Blocks) in J can apply to several data items at once.
Indeed, the basic datatype is an array, and J verbs are designed to apply to arrays.
For example, the following adds two lists of numbers:

```
>>> [1 2 3] * 10 + [2 3 5]
[12 23 35]
```

The _adverb_ in J takes a verb argument and returns another verb, typically related.
The J adverb / results in a verb that applies to each pair of elements, compare with above:

```
>>> [1 2 3] * 10 +.t [2 3 5]
[12 13 15; 22 23 25; 32 33 35]
```

Thus, +/ forms an addition table, and similarly, */ forms a multiplication table:

```
>>> [1 2 3] * 10 *.t [2 3 5]
[20 30 50; 40 60 100; 60 90 150]
```

Make a flattened list of associations:

```
>>> (1:3 ->.x 1:2)
[1 -> 1, 1 -> 2, 2 -> 1, 2 -> 2, 3 -> 1, 3 -> 2]
```

* * *

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/Modifiers)

Categories: Syntax
