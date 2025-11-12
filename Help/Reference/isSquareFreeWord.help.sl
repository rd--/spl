# isSquareFreeWord

- _isSquareFreeWord([x₁ x₂ …])_

Answer `true` if the word _x_ is square free.

```
>>> [1 2 1 3 1 2 3 1].isSquareFreeWord
true
```

The list of all square free words over a binary alphabet:

```
>>> [0; 1; 0 1; 1 0; 0 1 0; 1 0 1]
>>> .allSatisfy(isSquareFreeWord:/1)
true
```

The list of non-square free words over a binary alphabet:

```
>>> [
>>> 	0 0; 1 1;
>>> 	0 0 0; 0 0 1; 0 1 1;
>>> 	1 0 0; 1 1 0; 1 1 1
>>> ].noneSatisfy(isSquareFreeWord:/1)
true
```

The first differences of the Thue–Morse sequence is square free:

```
>>> let n = 40;
>>> n.thueMorseSequence
>>> .differences
>>> .isSquareFreeWord
true
```

Leech’s order thirteen uniform cyclic squarefree word,
OEIS [A337005](https://oeis.org/A337005):

```
>>> [
>>> 	0 1 2 1 0 2 1 2 0 1 2 1 0 1 2 0 2 1 0 2
>>> 	0 1 2 0 2 1 2 0 1 0 2 1 0 1 2 0 1 0 2 1
>>> 	2 0 2 1 0 2 0 1 2 0 2 1
>>> ].isSquareFreeWord
true
```

A square free word that is complete,
also called extremal,
so that no letter can be added at any position without it becoming non square-free:

```
>>> [
>>> 	1 2 3 1 2 1 3 2 3 1 2 3 2 1 2 3 1 2 1 3
>>> 	2 3 1 2 3
>>> ].isSquareFreeWord
true

>>> [
>>> 	4 2 3 1 2 1 3 1 2 4 1 2 1 3 1 2 1 4 3 1
>>> 	2 1 3 1 2 4 1 2 1 3 1 2 3 1 4 2 3 1 2 1
>>> 	3 1 2 4 1 2 1 3 1 2 1 4 3 1 2 1 3 1 2 4
>>> 	1 2 1 3 1 2 1
>>> ].isSquareFreeWord
true
```

* * *

See also: isSquareWord, lexicographicallyLeastSquareFreeWord

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquarefreeWord.html),
_OEIS_
[1](https://oeis.org/A337005),
_W_
[1](https://en.wikipedia.org/wiki/Square-free_word)
