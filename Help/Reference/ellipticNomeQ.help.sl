# ellipticNomeQ

- _ellipticNomeQ(m)_

Answer the nome _q_ corresponding to the parameter _m_ in an elliptic function.

```
>>> 0.5.ellipticNomeQ
0.0432139

>>> (5 / 16).ellipticNomeQ
0.0234012

>>> (3 / 17).ellipticNomeQ
0.0121323

>>> (1 / 7).ellipticNomeQ
0.0096332
```

At `zero`, one half, and `one`:

```
>>> 0.ellipticNomeQ
0

>>> (1 / 2).ellipticNomeQ
-1.pi.exp

>>> 1.ellipticNomeQ
1
```

Threads element-wise over lists:

```
>>> [0.2 0.3 0.4].ellipticNomeQ
[0.0139429 0.0222774 0.0318833]
```

The value of _m_ for which _q_ is 1/10:

```
>>> 0.802403.ellipticNomeQ
0.1
```

Plot over subset of reals:

~~~spl svg=A
(0 -- 0.995).functionPlot(ellipticNomeQ:/1)
~~~

![](Help/Image/ellipticNomeQ-A.svg)

* * *

See also: ellipticK

Guides: Mathematical Functions, Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nome.html)
[2](https://reference.wolfram.com/language/ref/EllipticNomeQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Nome_(mathematics))
