# inverseErf

- _inverseErf(s)_

Answer the inverse "error function" obtained as the solution for _z_ in _s = erf(z)_.

```
>>> 0.6.inverseErf
0.595116

>>> 0.595116.erf
0.6

>>> 0.33.inverseErf
0.301332

>>> 0.301332.erf
0.33
```

Threads over lists:

```
>>> (1 / [2 3 4 5]).inverseErf
[0.476936 0.304570 0.225312 0.179143]

>>> [0.476936 0.304570 0.225312 0.179143].erf
(1 / [2 3 4 5])
```

At `one` and `zero` and negative `one`:

```
>>> [-1 0 1].inverseErf
[inf.negated 0 inf]

>>> [inf.negated 0 inf].erf
[-1 0 1]
```

Plot over a subset of the reals:

~~~
(-0.99 -- 0.99).subdivide(500).inverseErf.plot
~~~

* * *

See also: erf, erfc

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/InverseErf.html)
