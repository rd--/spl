# sawtoothWave

- _sawtoothWave(x)_

Answer a sawtooth wave that alternates between 1 and 0 with unit period.

Evaluate numerically:

```
>>> 0.2.sawtoothWave
0.2
```

Threads over lists:

```
>>> [0 1/4 1/2 3/4 1].sawtoothWave
[0 1/4 1/2 3/4 0]

>>> [0.4 1.2 3.6].sawtoothWave
[0.4 0.2 0.6]
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(sawtoothWave:/1)
~~~

![](sw/spl/Help/Image/sawtoothWave-A.svg)

* * *

See also: clip, fractionPart, Piecewise, squareWave, triangleWave

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SawtoothWave.html)
[2](https://reference.wolfram.com/language/ref/SawtoothWave.html),
_W_
[1](https://en.wikipedia.org/wiki/Sawtooth_wave)
