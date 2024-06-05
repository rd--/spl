# AmpDb

- _AmpDb(aNumber)_

Convert linear amplitude to decibels.
Inverse of `DbAmp`.

```
>>> AmpDb(0.1)
-20
```

Threads over lists:

```
>>> [0.000001 0.001 0.01 0.1 1].AmpDb
[-120 -60 -40 -20 0]
```

Plot curve:

~~~
(0.001 -- 1).functionPlot(AmpDb:/1)
~~~

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

* * *

See also: DbAmp

References:
_Csound_
[1](https://csound.com/docs/manual/ampdb.html),
_Max_
[1](https://docs.cycling74.com/max8/refpages/atodb)

Categories: Ugen, Converting
