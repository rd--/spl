# erf

- _erf(z)_

Answer the "error function", encountered in integrating the normal distribution.

The error function near `one`:

```
>>> 0.9.erf
0.7969

>>> 0.95.erf
0.8209
```

The generalized error function:

```
>>> 2.erf - 1.5.erf
0.029217
```

Threads elementwise over lists:

```
>>> [0.5 1 1.5].erf
[0.5205 0.8427 0.9661]

>>> [1 / 2, 1.41, 2.sqrt].erf
[0.5205 0.9538 0.9545]
```

Plot over a subset of the reals:

~~~
(-3 -- 3).subdivide(600).erf.plot
~~~

* * *

See also: erfc

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Erf.html),
_Mathworks_
[1](https://au.mathworks.com/help/symbolic/erf.html),
_W_
[1](https://en.wikipedia.org/wiki/Error_function)

Further Reading: Abramowitz 1964
