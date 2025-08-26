# interleave

- _interleave([l₁, l₂, …])_

Answer a `List` that has, alternately, the elements of _l₁, l₂, …_.

```
>>> [3 4 5 ; 0 1 2].interleave
[3 0 4 1 5 2]
```

Shorter sequences are cycled as required,
meaning that the answer is always twice the size of the longest sequence:

```
>>> [3 4 5; 1 2].interleave
[3 1 4 2 5 1]

>>> [3 4; 0 1 2].interleave
[3 0 4 1 3 2]
```

Alternate positive and negative integers:

```
>>> [
>>> 	[1 .. 10],
>>> 	[-1, -2 .. -10]
>>> ].interleave
[
	1 -1 2 -2 3 -3 4 -4 5 -5
	6 -6 7 -7 8 -8 9 -9 10 -10
]
```

* * *

See also: intercalate, intersperse, irregularTransposition, transpose

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Riffle.html)

Categories: Rearranging
