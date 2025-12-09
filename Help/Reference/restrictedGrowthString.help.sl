# restrictedGrowthString

- _restrictedGrowthString(w)_

Answer a restricted growth string associated with the Dyck word _w_.
There are multiple possible associated strings,
the one given here is the height at each opening parenthesis,
and is one-indexed.

```
>>> [
>>> 	1 1 0 0 1 0;
>>> 	1 1 0 0 1 1 0 0
>>> ].collect { :w |
>>> 	let d = DyckWord(w);
>>> 	[
>>> 		d.parenthesization,
>>> 		d.restrictedGrowthString
>>> 	]
>>> }
[
	[
		'(())()',
		[1 2 1]
	],
	[
		'(())(())',
		[1 2 1 2]
	]
]
```

The restricted growth string associated with a Dyck is a restricted growth string:

```
>>> 4.dyckWords.allSatisfy { :w |
>>> 	DyckWord(w)
>>> 	.restrictedGrowthString
>>> 	.isRestrictedGrowthString
>>> }
true
```

* * *

See also: DyckWord, restrictedGrowthStrings

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RestrictedGrowthString.html)
