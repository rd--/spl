# log10

_log10(aNumber)_

Answers the base-10 logarithm of _aNumber_.

```
>>> 1000000.log10
6

>>> 5.log10
0.69897

>>> 2.log10
0.30103

>>> 1.75.log10
0.243038

>>> 0.log10
(0 - inf)

>>> let n = system.nextRandomFloat;
>>> n.log10
(n.log / 10.log)
```

Plot over a subset of the reals:

```
(0.01, 0.02 .. 5).log10.plot
```

* * *

See also: ^, log

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Log10.html)
