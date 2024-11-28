# subsequences

- _subsequences(aSequence, aBlock:/1)_
- _subsequences(alpha)_ ⟹ _subsequences(alpha, true.constant)_

Answer a `List` of all of the subsequences (both contiguous and disjoint) of _aSequence_
for which _aBlock_ answers `true`.
In the unary case answer all subsequences.

The subsequences of _abc_:

```
>>> ['a' 'b' 'c'].subsequences.collect(stringJoin:/1)
['', 'a', 'b', 'ab', 'c', 'ac', 'bc', 'abc']
```

The three element subsequences of the permutation _351462_:

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
