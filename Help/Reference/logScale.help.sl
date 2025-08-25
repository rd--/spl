# logScale

- _logScale(x)_

Answer the number _x_,
converted to a `SmallFloat`,
scaled by `log`.
That is, the magnitude is scaled and the sign is retained.
At `zero` answers 0.

Threads over lists:

```
>>> (-9 .. 9).collect {
>>> 	:each | 10 ^ each
>>> }.logScale.round
[
	-21 -18 -16 -14 -12 -9 -7 -5 -2
	0
	2 5 7 9 12 14 16 18 21
]
```

Plot:

~~~spl svg=A
(-33 .. 33).collect { :each |
	10 ^ each
}.logScale.discretePlot
~~~

![](sw/spl/Help/Image/logScale-A.svg)

* * *

See also: *, abs, log, log2, log10, sign
