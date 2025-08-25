# roundDownTo

- _roundDownTo(n, d)_

Answer the number _n_ rounded down to a multiple of _d_.

```
>>> (1 / 1:10).collect { :n |
>>> 	[n, n.roundDownTo(0.025)]
>>> }
[
	1 1;
	0.5 0.5;
	0.3333 0.325;
	0.25 0.25;
	0.2 0.2;
	0.16666 0.15;
	0.14285 0.125;
	0.125 0.125;
	0.1111 0.1;
	0.1 0.1
]
```

* * *

See also: floor, round, roundTo, roundUpTo, truncate

Guides: Integer Functions
