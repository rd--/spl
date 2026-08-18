# AmpDb

- _AmpDb(x)_

Convert linear amplitude to decibels.
Equal to `log10` of _x_ `times` twenty.
Inverse of `DbAmp`.
Alias of `ampDb`.

```
>>> AmpDb(0.1)
-20

>>> 0.1.log10 * 20
-20

>>> AmpDb(4)
12.0412

>>> 4.log10 * 20
12.0412
```

Threads over lists,
powers to ten and powers of two:

```
>>> [0.000001 0.001 0.01 0.1 1 10].AmpDb
[-120 -60 -40 -20 0 20]

>>> [0.25 0.5 1 2 4].AmpDb
[-12.04 -6.02 0 6.02 12.04]
```

Plot curve:

~~~spl svg=A
(0.001 -- 1).functionPlot(AmpDb:/1)
~~~

![](Help/Image/AmpDb-A.svg)

Compare linear and exponential curves as frequency control:

```
SinOsc(
	[
		Line(0.001, 1, 2).AmpDb,
		Line(-96, 0.001, 2)
	] * 110 + 110,
	0
) * 0.1
```

Evaluate symbolically:

```
>> ampDb(`x`)
(* (log10 x) 20)
```

* * *

See also: DbAmp

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/ampdb.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/mag2db.html)
[2](https://mathworks.com/help/signal/ref/pow2db.html),
_Max_
[1](https://docs.cycling74.com/reference/atodb/),
_W_
[1](https://en.wikipedia.org/wiki/Decibel)

Categories: Math, Ugen, Converting
