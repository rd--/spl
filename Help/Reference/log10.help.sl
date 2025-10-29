# log10

- _log10(x)_

Answers the base-10 logarithm of the number _x_.

```
>>> (10 ^ 6).log10
6

>>> 5.log10
0.69897

>>> (2.log10, 2.log(10))
(0.30103, 0.30103)

>>> 1.75.log10
0.243038

>>> 0.log10
(0 - Infinity)

>>> let n = system.nextRandomFloat;
>>> n.log10
(n.log / 10.log)
```

At `Fraction`:

```
>>> 7/4.log10
0.243038
```

Threads over lists:

```
>>> [0.01 0.1 1 10 100 1000].log10
[-2 -1 0 1 2 3]

>>> [1 2.5 5 7.5 10 25 50 75 100].log10.round
[0 0 1 1 1 1 2 2 2]
```

Plot over a subset of the reals:

~~~spl svg=A
(0.01 -- 5).functionPlot(log10:/1)
~~~

![](sw/spl/Help/Image/log10-A.svg)

* * *

See also: ^, log

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CommonLogarithm.html)
[2](https://reference.wolfram.com/language/ref/Log10.html)
_W_
[1](https://en.wikipedia.org/wiki/Common_logarithm)
