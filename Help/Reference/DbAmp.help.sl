# DbAmp

- _DbAmp(aNumber)_

Convert decibels to linear amplitude.

```
>>> DbAmp(-20)
0.1
```

Threads over lists:

```
>>> [-120 -60 -40 -20 0 6].DbAmp
[0.000001 0.001 0.01 0.1 1 1.9953]
```

Plot curve:

~~~spl svg=A
(-120 -- 0).functionPlot(DbAmp:/1)
~~~

![](sw/spl/Help/Image/DbAmp-A.svg)

Fixed amplitude:

```
SinOsc(440, 0) * -24.DbAmp
```

Modulate amplitude:

```
let mul = Line(-12, -40, 10).DbAmp;
SinOsc(800, 0) * mul
```

Evaluate symbolically:

```
>> DbAmp(`x`)
(^ 10 (* x 0.05))
```

* * *

See also: AmpDb

References:
_Csound_
[1](https://csound.com/docs/manual/dbamp.html),
_Max_
[1](https://docs.cycling74.com/max8/refpages/dbtoa)

Categories: Math, Ugen
