# barlowHarmonicity

- _barlowHarmonicity(aFraction)_

Compute the harmonicity of the interval _aFraction_.
The answer is a signed real number.
The magnitude indicates _harmonicity_,
the sign indicates polarity.
A negative sign indicates a polarity to the upper tone.

```
>>> 48/25.barlowHarmonicity
-0.05137

>>> 3/2.barlowHarmonicity
0.27272

>>> 1/1.barlowHarmonicity
Infinity
```

Table of harmonicities:

```
>>> [
>>> 	1/1 81/80 25/24 16/15 27/25
>>> 	10/9 9/8 8/7 7/6 75/64
>>> 	32/27 6/5 5/4 81/64 9/7
>>> 	36/25 4/3 27/20 25/18 45/32
>>> 	64/45 36/25 40/27 3/2 14/9
>>> 	25/16 8/5 81/50 5/3 27/16
>>> 	12/7 7/4 16/9 9/5 50/27
>>> 	15/8 48/25 2/1
>>> ].collect { :each |
>>> 	(each.barlowHarmonicity * 100)
>>> 	.rounded
>>> }
[
	Infinity 5 5 -8 -5
	8 12 -8 7 5
	-8 -10 12 6 -6
	-5 -21 -6 5 6
	-6 -5 6 27 6
	6 -11 -4 11 8
	-7 8 -11 -9 5
	8 -5 100
]
```

* * *

See also: barlowDisharmonicity, barlowIndigestibility, eulerGradusSuavitatis, tenneyHeight
