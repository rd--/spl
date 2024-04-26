# barlowHarmonicity

- _barlowHarmonicity(aFraction)_

Compute the harmonicity of the interval _aFraction_.

```
>>> 3/2.barlowHarmonicity
0.27272
```

>>> [
>>> 	1/1 16/15 10/9
>>> 	9/8 8/7 7/6 32/27 6/5
>>> 	5/4 81/64 9/7
>>> 	4/3 27/20
>>> 	3/2 14/9
>>> 	8/5
>>> 	5/3 27/16 12/7 7/4
>>> 	16/9 9/5 15/8
>>> 	2/1
>>> ].collect { :each |
>>> 	(each.barlowHarmonicity * 100).rounded
>>> }
[
	inf 8 8
	12 8 7 8 10
	12 6 6
	21 6
	27 6
	11
	11 8 7 8
	11 9 8
	100
]
```

* * *

See also: barlowDisharmonicity, barlowIndigestibility
