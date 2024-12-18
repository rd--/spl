# intervalsBy

- _intervalsBy(aScale, anInteger)_

Answer the cyclic intervals of _aScale_ at the specified distance _anInteger_.
`intervals` is `intervalsBy` of `one`.

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> (1 .. 7).collect { :each |
>>> 	s.intervalsBy(each)
>>> }
[
	2 2 1 2 2 2 1;
	4 3 3 4 4 3 3;
	5 5 5 6 5 5 5;
	7 7 7 7 7 7 6;
	9 9 8 9 9 8 8;
	11 10 10 11 10 10 10;
	12 12 12 12 12 12 12
]
```

* * *

See also: intervalClass, intervalClasses, intervals, Scale

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_class)
