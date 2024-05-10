# permutationSymbol

- _permutationSymbol(aSequence)_

Answer the permutation symbol of the permutation needed to place the elements of _aSequence_ in canonical order.

The permutation symbol is _-1 ^ n_,
where _n_ is the number of transpositions of pairs of elements that must be composed to build up the permutation.

```
>>> [4 2 3 1 5].permutationSymbol
-1 ^ 5

>>> [1 3 2 5 4].permutationSymbol
-1 ^ 2

>>> [].permutationSymbol
-1 ^ 0

>>> [4 1 5 2 3 7 8 6].permutationSymbol
-1
```

Even and odd permutations:

```
>>> (
>>> 	[1 2 3].permutationSymbol,
>>> 	[1 3 2].permutationSymbol
>>> )
(1, -1)
```

Find even permutations:

```
>>> let l = [1 2 3 4].permutations;
>>> let e = l.select { :each |
>>> 	each.permutationSymbol = 1
>>> };
>>> e.collect { :each |
>>> 	each.collect { :index |
>>> 		['a' 'b' 'c' 'd'][index]
>>> 	}
>>> }
[
	'a' 'b' 'c' 'd'; 'a' 'c' 'd' 'b'; 'a' 'd' 'b' 'c';
	'b' 'a' 'd' 'c'; 'b' 'c' 'a' 'd'; 'b' 'd' 'c' 'a';
	'c' 'b' 'd' 'a'; 'c' 'a' 'b' 'd'; 'c' 'd' 'a' 'b';
	'd' 'b' 'a' 'c'; 'd' 'c' 'b' 'a'; 'd' 'a' 'c' 'b'
]
```

Rank-3 totally antisymmetric (Levi-Civita) tensor:

```
>>> { :i :j :k |
>>> 	[i j k].permutationSymbol
>>> }.table(1:3, 1:3, 1:3)
[
	0 0 0; 0 0 1; 0 -1 0:;
	0 0 -1; 0 0 0; 1 0 0:;
	0 1 0; -1 0 0; 0 0 0
]
```

The `permutationSymbol` is the _signature_ of a `Permutation`:

```
>>> [4 2 3 1 5].asPermutation.signature
-1

>>> [1 3 2 5 4].asPermutation.signature
1

>>> [].asPermutation.signature
-1 ^ 0
```

* * *

See also: cross, kroneckerDelta, permutations

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PermutationSymbol.html)
[2](https://reference.wolfram.com/language/ref/Signature.html)
