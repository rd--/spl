# logScale

- _logScale(x, c)_

Answer a modified `log` transform of the number _x_.
The magnitude is scaled and the sign is retained.
If the constant _c_ is elided it is equal to _1/ln(10)_.

```
>>> 4.logScale
1.009

>>> (1 + (4 * 10.log)).log10
1.009

>>> -4.logScale
-1.009
```

At `zero` answers `zero`:

```
>>> 0.logScale
0
```

Threads over lists:

```
>>> [-10 -1 0 1 10].collect(logScale:/1)
[-1.38068 -0.51885 0 0.51885 1.38068]
```

Plot positive half over _(0,100)_:

~~~spl svg=A
(0 -- 100).functionPlot(logScale:/1)
~~~

![](sw/spl/Help/Image/logScale-A.svg)

Plot negative half over _(-1,0)_:

~~~spl svg=B
(-1 -- 0).functionPlot(logScale:/1)
~~~

![](sw/spl/Help/Image/logScale-B.svg)

* * *

See also: *, abs, log, log2, log10, sign

Guides: Mathematical Functions, Plotting Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Logarithmic_scale)

Further Reading: Webber 2013
