# roundUp

- _roundUp(n, α=1)_

Answer the next multiple of the number _n_ toward infinity that is nearest the number _α_.

```
>>> 3.1479.roundUp(0.01)
3.15

>>> 3.1479.roundUp(0.1)
3.2

>>> 1923.roundUp(10)
1930

>>> 3.1479.roundUp(0.005)
3.15

>>> 226.roundUp(10)
230
```

At negative _n_:

```
>>> -3.1479.roundUp(0.01)
-3.14
```

Table of integer divisions:

```
>>> (1 / 1:10).collect { :n |
>>> 	[n, n.roundUp(0.025)]
>>> }
[
	1       1;
	0.5     0.5;
	0.3333  0.35;
	0.25    0.25;
	0.2     0.2;
	0.16666 0.175;
	0.14285 0.15;
	0.125   0.125;
	0.1111  0.125;
	0.1     0.1
]
```

If _α_ is elided it is set to `one`,
and the answer is the same as for `ceiling`:

```
>>> (1.1.roundUp, 1.1.ceiling)
(2, 2)

>>> (-1.1.roundUp, -1.9.ceiling)
(-1, -1)
```

* * *

See also: ceiling, round, roundDown, truncate

Guides: Rounding Functions

Categories: Truncating, Rounding
