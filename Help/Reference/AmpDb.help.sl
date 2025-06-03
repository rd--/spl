# AmpDb

- _AmpDb(aNumber)_

Convert linear amplitude to decibels.
Inverse of `DbAmp`.

```
>>> AmpDb(0.1)
-20

>>> AmpDb(4)
12.0412
```

Threads over lists:

```
>>> [0.000001 0.001 0.01 0.1 1].AmpDb
[-120 -60 -40 -20 0]
```

Plot curve:

~~~spl svg=A
(0.001 -- 1).functionPlot(AmpDb:/1)
~~~

![](sw/spl/Help/Image/AmpDb-A.svg)

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
>> AmpDb(`x`)
(* (log10 x) 20)
```

* * *

See also: DbAmp

References:
_Csound_
[1](https://csound.com/docs/manual/ampdb.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/mag2db.html)
[2](https://mathworks.com/help/signal/ref/pow2db.html),
_Max_
[1](https://docs.cycling74.com/reference/atodb/)

Categories: Math, Ugen, Converting
