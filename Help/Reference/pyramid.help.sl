# pyramid

- _pyramid(aSequence, patternType)_

Return a new sequence whose elements are those of _aSequence_ reordered using a "counting" algorithm.
_patternType_ is an integer and selects the counting algorithm.

Print counting algorithms:

```
>>> [1 3 4 5 6 7].collect { :each |
>>> 	[1 .. 5].pyramid(each)
>>> }
[
	1 1 2 1 2 3 1 2 3 4 1 2 3 4 5;
	1 1 2 1 2 3 1 2 3 4 1 2 3 4 5;
	1 2 3 4 5 2 3 4 5 3 4 5 4 5 5;
	1 1 2 1 2 3 1 2 3 4 1 2 3 4 5
	1 2 3 4 5 1 2 3 4 1 2 3 1 2 1;
	5 4 5 3 4 5 2 3 4 5 1 2 3 4 5;
	1 2 3 4 5 1 2 3 4 1 2 3 1 2 1
	1 1 2 1 2 3 1 2 3 4 1 2 3 4 5
]
```

* * *

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-pyramid)

Categories: Counting
