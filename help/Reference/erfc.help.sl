# erfc

- _erfc(z)_

Answer the complementary error function, being _1 - erf(z)_.

The error function near `one`:

```
>>> 0.9.erfc
0.20309

>>> 0.95.erfc
0.17911
```

Threads elementwise over lists:

```
>>> [0.5 1 1.5].erfc
[0.479499 0.157299 0.033894]
```

Plot over a subset of the reals:

~~~
(-3 -- 3).subdivide(600).erfc.plot
~~~

* * *

See also: erf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Erfc.html)

Further Reading: Abramowitz 1964
