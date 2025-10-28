# tagSystem

- _tagSystem(m, r, i, k)_

Answer the successive words of the tag system with the rule _r_,
where _m_ elements are removed from the beginning of the sequence,
starting from initial condition _i_,
for at most _k_ steps.

First few steps in the evolution of a tag system:

```
>>> 1.tagSystem(
>>> 	[0 -> [1 0], 1 -> [0 1]],
>>> 	[1],
>>> 	6
>>> )
[
	1;
	0 1;
	1 1 0;
	1 0 0 1;
	0 0 1 0 1;
	0 1 0 1 1 0
]
```

Run a tag system to completion:

```
>>> 2.tagSystem(
>>> 	[
>>> 		'a' -> 'bc',
>>> 		'b' -> 'a',
>>> 		'c' -> 'aaa'
>>> 	],
>>> 	'aaa'.characters,
>>> 	Infinity
>>> ).collect(stringJoin:/1)
[
	'aaa'
	'abc'
	'cbc'
	'caaa'
	'aaaaa'
	'aaabc'
	'abcbc'
	'cbcbc'
	'cbcaaa'
	'caaaaaa'
	'aaaaaaaa'
	'aaaaaabc'
	'aaaabcbc'
	'aabcbcbc'
	'bcbcbcbc'
	'bcbcbca'
	'bcbcaa'
	'bcaaa'
	'aaaa'
	'aabc'
	'bcbc'
	'bca'
	'aa'
	'bc'
	'a'
]
```

Plot the size of each sucessive term:

~~~spl svg=A
3.tagSystem(
	[0 -> [0 0], 1 -> [1 1 0 1]],
	[1 0 0 1 0 0 1 0 0 0 0 0],
	419
).collect(size:/1).linePlot
~~~

![](sw/spl/Help/Image/tagSystem-A.svg)

Matrix plot of first few terms:

~~~spl svg=B
1.tagSystem(
	[1 -> [1 0], 0 -> [0 1]],
	[1],
	21
).padRight.matrixPlot
~~~

![](sw/spl/Help/Image/tagSystem-B.svg)

* * *

See also: locallyCatenativeSequence, substitutionSystem

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TagSystem.html),
_W_
[1](https://en.wikipedia.org/wiki/Tag_system)
