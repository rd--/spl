# intervalsBy

- _intervalsBy(s, n)_

Answer the cyclic intervals of the scale _s_ at the specified distance _n_.
`intervals` is `intervalsBy` of `one`.

```
>>> let s = Scale([2 2 1 2 2 2 1], 'Maj.');
>>> (1 .. 7).collect { :n |
>>> 	s.intervalsBy(n)
>>> }
[
	 2  2  1  2  2  2  1;
	 4  3  3  4  4  3  3;
	 5  5  5  6  5  5  5;
	 7  7  7  7  7  7  6;
	 9  9  8  9  9  8  8;
	11 10 10 11 10 10 10;
	12 12 12 12 12 12 12
]
```

* * *

See also: intervalClass, intervalClasses, intervals, Scale

Guides: Scale Functions, Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_class)
