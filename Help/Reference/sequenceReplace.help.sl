# sequenceReplace

- _sequenceReplace(list, rules, n=∞)_

Replaces at most _n_ sequences in _list_ according to the specified rule or list of _rules_.

Replace sub-sequences that match a sequence:

```
>>> [1 2 3 3 1 2]
>>> .sequenceReplace([1 2] -> 2)
[2 3 3 2]
```

Replace sub-sequences that match any of the rules,
if the left hand side of a rule it not a sequence it is understood to be a sequence of one place:

```
>>> [1 2 3 3 1 2].sequenceReplace(
>>> 	[[1 2] -> 2, 3 -> 4]
>>> )
[2 4 4 2]
```

Replace only the first two matches of the rules:

```
>>> [1 2 3 3 1 2].sequenceReplace(
>>> 	[[1 2] -> 2, 3 -> 4],
>>> 	2
>>> )
[2 4 3 1 2]
```

Duplicate elements in a list:

```
>>> [1 2 1]
>>> .sequenceReplace(1 -> [1 1 1])
[1 1 1 2 1 1 1]
```

Remove sequences of a list:

```
>>> [1 2 3 1 2 3]
>>> .sequenceReplace([1 2] -> [])
[3 3]
```

Exchange elements:

```
>>> [1 2 3 1 2 3]
>>> .sequenceReplace([2 3] -> [3 2])
[1 3 2 1 3 2]
```

Rules are tried in the given order:

```
>>> [1 2 3 2 1].sequenceReplace(
>>> 	[[1 2] -> 4, 1 -> 3]
>>> )
[4 3 2 3]
```

* * *

See also: substitutionSystem

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SequenceReplace.html)
