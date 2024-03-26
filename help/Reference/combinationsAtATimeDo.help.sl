# combinationsAtATimeDo

- _combinationsAtATimeDo(aSequence, anInteger, aBlock:/1)_

Take the items in the _aSequence_, _anInteger_ at a time, and evaluate _aBlock:/1_ for each combination.
Hand in a list of elements of _aSequence_ as the block argument.
Each combination only occurs once, and order of the elements does not matter.
There are _aSequence.size.take(anInteger) combinations.

```
>>> let l = [];
>>> 0:4.combinationsAtATimeDo(3) { :each | l.add(each.copy) };
>>> l
[
	0 1 2; 0 1 3; 0 1 4; 0 2 3; 0 2 4; 0 3 4;
	1 2 3; 1 2 4; 1 3 4;
	2 3 4
]
```

* * *

See also: combinations, subsets

Categories: Enumerating
