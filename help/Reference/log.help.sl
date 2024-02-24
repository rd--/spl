# log

- _log(aNumber)_
- _log(aNumber, base)_

The unary form answers the natural logarithm of _aNumber_:

```
>>> 1000.log
6.90776

>>> 1.5.log
0.405465

>>> e.log
1

>>> 0.log
inf.negated

>>> 1.log
0
```

The binary form answers the _base_ logarithm of _aNumber_.

```
>>> 1000.log(10)
3

>>> 1.5.log(3)
0.36907

>>> 1024.log(2)
10

>>> (3 ^ -12).log(3)
-12

>>> pi.sqrt.log(pi)
0.5

>>> 1.log(system.nextRandomFloat)
0
```

Complex arguments:

```
>>> 2.5j1.log
0.990501j0.380506
```

Log threads elementwise over lists:

```
>>> [1 2.1 3.1 4.1].log
[0 0.741937 1.13140 1.41099]
```

Plot over a subset of the reals:

~~~
(0.01, 0.02 .. 5).log.plot
~~~

* * *

See also: log, log2, log10

References:
_Dlmf_
[1](https://dlmf.nist.gov/4.2#i)
_Mathematica_
[1](https://mathworld.wolfram.com/Logarithm.html)
[2](https://reference.wolfram.com/language/ref/Log.html)
