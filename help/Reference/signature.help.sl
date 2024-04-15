# signature

- _signature(aPermutation)

Answer the signature of the permutation needed to place the elements of list in canonical order.

The signature of the permutation is _-1 ^ n_,
where n is the number of transpositions of pairs of elements that must be composed to build up the permutation.

```
>>> [4 2 3 1 5].signature
-1

>>> [1 3 2 5 4].signature
1

>>> [].signature
1

>>> ([1 2 3].signature, [1 3 2].signature)
(1, -1)
```

Find even permutations:

```
>>> let l = [1 2 3 4].permutations;
>>> let e = l.select { :each | each.signature = 1 };
>>> e.collect { :each | each.collect { :index | ['a' 'b' 'c' 'd'][index] } }
[
	'a' 'b' 'c' 'd'; 'a' 'c' 'd' 'b'; 'a' 'd' 'b' 'c';
	'b' 'a' 'd' 'c'; 'b' 'c' 'a' 'd'; 'b' 'd' 'c' 'a';
	'c' 'b' 'd' 'a'; 'c' 'a' 'b' 'd'; 'c' 'd' 'a' 'b';
	'd' 'b' 'a' 'c'; 'd' 'c' 'b' 'a'; 'd' 'a' 'c' 'b'
]
```

Rank-3 totally antisymmetric (Levi-Civita) tensor:

```
>>> { :i :j :k | [i j k].signature }.table(1:3, 1:3, 1:3)
[
	0 0 0; 0 0 1; 0 -1 0:;
	0 0 -1; 0 0 0; 1 0 0:;
	0 1 0; -1 0 0; 0 0 0
]
```

* * *

See also: cross, Minors Det LeviCivitaTensor KroneckerDelta Order OrderedQ Permutations
