# locallyCatenativeSequence

- _locallyCatenativeSequence(w, i, n)_

The Fibonacci word can be written as a locally catenative sequence,
the _n_-th word being the catenation the words at _n-1_ and _n-2_:

```
>>> ['a'; 'a' 'b']
>>> .locallyCatenativeSequence([1 2], 5)
>>> .collect(stringJoin:/1)
[
	'a'
	'ab'
	'aba'
	'abaab'
	'abaababa'
	'abaababaabaab'
	'abaababaabaababaababa'
]
```

The Thue-Morse sequence can be written as a locally catenative sequence given encoding functions for each component,
the _n_-th word is a catenation of the word at _n-1_ with an encoded copy of itself:

```
>>> [[0]].locallyCatenativeSequence(
>>> 	[1 1],
>>> 	4,
>>> 	[{ :x | x }, { :x | 1 - x }]
>>> )
[
	0;
	0 1;
	0 1 1 0;
	0 1 1 0 1 0 0 1;
	0 1 1 0 1 0 0 1 1 0 0 1 0 1 1 0
]
```

* * *

See also: fibonacciWord, substitutionSystem, thueMorseSequence

References:
_W_
[1](https://en.wikipedia.org/wiki/Locally_catenative_sequence)

Further Reading: Allouche and Johnson 2018, Shallit 1988
