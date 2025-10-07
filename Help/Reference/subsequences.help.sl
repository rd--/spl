# subsequences

- _subsequences([x₁ x₂ …], f:/1)_

Answer a `List` of all of the subsequences (both contiguous and disjoint) of _x_
for which _f_ answers `true`.
In the unary case answer all subsequences.

At `String`,
the subsequences of _abc_:

```
>>> 'abc'.subsequences
[
	'' 'a' 'b' 'ab' 'c' 'ac' 'bc' 'abc'
]
```

At `List`,
the three element subsequences of the permutation _351462_:

```
>>> [3 5 1 4 6 2].subsequences { :each |
>>> 	each.size = 3
>>> }
[
	3 5 1; 3 5 4; 3 1 4; 5 1 4;
	3 5 6; 3 1 6; 5 1 6; 3 4 6;
	5 4 6; 1 4 6; 3 5 2; 3 1 2;
	5 1 2; 3 4 2; 5 4 2; 1 4 2;
	3 6 2; 5 6 2; 1 6 2; 4 6 2
]
```

The subsequences are given by indexing according to the powerset of the indices:

```
>>> let list = ['a' 'b' 'c'];
>>> list.indices.subsequences
list.indices.powerSet
```

* * *

See also: powerSet, subsequencesDo, substrings

Guides: Sequence Alignment Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Subsequence.html)
[2](https://reference.wolfram.com/language/ref/Subsequences.html),
_W_
[1](https://en.wikipedia.org/wiki/Subsequence)
