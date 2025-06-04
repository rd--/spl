# squareWave

- _squareWave(x)_

Answer a square wave that alternates between 1 and -1 with unit period.

Evaluate numerically:

```
>>> 0.2.squareWave
1
```

Threads over lists:

```
>>> [-1 1/4 0.5 1.6].squareWave
[1 1 -1 -1]

>>> [0.4 1.2 3.6].squareWave
[1 1 -1]
```

Plot over a subset of the reals:

~~~spl svg=A
(-3 -- 3).functionPlot(squareWave:/1)
~~~

![](sw/spl/Help/Image/squareWave-A.svg)

* * *

See also: integerPart, Piecewise, sawtoothWave, sin, triangleWave, unitBox, unitStep

Guides: Signal Processing Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareWave.html)
[2](https://reference.wolfram.com/language/ref/SquareWave.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.square.html),
_W_
[1](https://en.wikipedia.org/wiki/Square_wave_(waveform))
