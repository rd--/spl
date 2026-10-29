# dbAmp

- _dbAmp(x)_

Convert decibels to linear amplitude.
Alias for `dbAmp`.

```
>>> dbAmp(-20)
0.1

>>> dbAmp(12.0412)
4
```

Threads over lists:

```
>>> [-120 -60 -40 -20 0 20].dbAmp
[0.000001 0.001 0.01 0.1 1 10]

>>> [-12.041 -6.02 0 6.02 12.041].dbAmp
[0.25 0.5 1 2 4]
```

Plot curve:

~~~spl svg=A
(-120 -- 0).functionPlot(dbAmp/1)
~~~

![](Help/Image/dbAmp-A.svg)

Fixed amplitude:

~~~spl syn=A
sinOsc(440, 0) * -24.dbAmp
~~~

Modulate amplitude:

~~~spl syn=B
let mul = line(-12, -40, 10).dbAmp;
sinOsc(800, 0) * mul
~~~

Evaluate symbolically:

```
>> dbAmp(`x`)
(^ 10 (* x 0.05))
```

* * *

See also: AmpDb

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/dbamp.html),
_Max_
[1](https://docs.cycling74.com/reference/dbtoa/),
_W_
[1](https://en.wikipedia.org/wiki/Decibel)

Categories: Math, Ugen
