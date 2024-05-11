# roundUpTo

- _roundUpTo(aNumber, anotherNumber)_

Answer the next multiple of _anotherNumber_ toward infinity that is nearest _aNumber_.

```
>>> 3.1479.roundUpTo(0.01)
3.15

>>> 3.1479.roundUpTo(0.1)
3.2

>>> 1923.roundUpTo(10)
1930

>>> 3.1479.roundUpTo(0.005)
3.15

>>> -3.1479.roundUpTo(0.01)
-3.14

>>> 226.roundUpTo(10)
230
```

Table of integer divisions:

```
>>> (1 / 1:10).collect { :n |
>>> 	[n, n.roundUpTo(0.025)]
>>> }
[
	1 1;
	0.5 0.5;
	0.3333 0.35;
	0.25 0.25;
	0.2 0.2;
	0.16666 0.175;
	0.14285 0.15;
	0.125 0.125;
	0.1111 0.125;
	0.1 0.1
]
```

* * *

See also: ceiling, roundTo, truncateTo

Categories: Truncating, Rounding
