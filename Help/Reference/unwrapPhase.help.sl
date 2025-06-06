# unwrapPhase

- _unwrapPhase(l, period)_

Unwrap the phases at list _l_ by taking the complement of large deltas with respect to the _period_,
replacing items having an absolute difference from their predecessor of more than _period/2_ with their _period_-complementary value.

```
>>> ([0 1 2 7 8] / 4).pi.unwrapPhase(2.pi)
([0 1 2 -1 0] / 4).pi

>>> [0 1 2 7 8].unwrapPhase(8)
[0 1 2 -1 0]

>>> [0 1 2 -1 0].unwrapPhase(4)
[0 1 2 3 4]

>>> [1 2 3 4 5 6 1 2 3].unwrapPhase(6)
[1 2 3 4 5 6 7 8 9]

>>> [2 3 4 5 2 3 4 5].unwrapPhase(4)
[2 3 4 5 6 7 8 9]

>>> (([0, 40 .. 720] % 360) - 180)
>>> .unwrapPhase(360)
[-180, -140 .. 540]
```

Undo modulo:

```
>>> ([1 .. 100] % 8).unwrapPhase(8)
[1 .. 100]
```

Unwrap and offset a sawtooth wave:

~~~spl svg=A
let a = (0 -- 4).discretize(100);
let b = a.sawtoothWave;
let c = b.unwrapPhase(1);
[b, c + 1].linePlot
~~~

![](sw/spl/Help/Image/unwrapPhase-A.svg)

* * *

See also: %, differences, wrap

Guides: Signal Processing Functions

References:
_Mathematica_
[1](https://resources.wolframcloud.com/FunctionRepository/resources/PhaseUnwrap/),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/unwrap.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.unwrap.html)
