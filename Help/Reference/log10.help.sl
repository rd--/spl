# log10

- _log10(aNumber)_

Answers the base-10 logarithm of _aNumber_.

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
(0 - inf)

>>> let n = system.nextRandomFloat;
>>> n.log10
(n.log / 10.log)
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
[1](https://reference.wolfram.com/language/ref/Log10.html)
