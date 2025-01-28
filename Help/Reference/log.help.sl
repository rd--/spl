# log

- _log(aNumber)_
- _log(aNumber, base)_

The unary form answers the natural logarithm of _aNumber_:

```
>>> 1000.log
6.90776

>>> 1.5.log
0.405465

>>> 1.e.log
1
```

At `zero` and `one`:

```
>>> 0.log
-1.inf

>>> 1.log
0
```

The binary form answers the _base_ logarithm of _aNumber_.

```
>>> 1000.log(10)
3

>>> 1.5.log(3)
0.36907

>>> 2.log(10)
3.0103E-1

>>> 1024.log(2)
10

>>> (3 ^ -12).log(3)
-12

>>> 1.pi.sqrt.log(1.pi)
0.5

>>> 1.log(system.nextRandomFloat)
0
```

Complex arguments:

```
>>> 2.5J1.log
0.990501J0.380506
```

Show that the natural logarithm of -1 is iπ:

```
>>> -1J0.log
0J3.14159
```

Log threads elementwise over lists:

```
>>> [1 2.1 3.1 4.1].log
[0 0.741937 1.13140 1.41099]

>>> [0.5 1 2 32 1024].log(2)
[-1 0 1 5 10]

>>> (2 ^ [1 2 3 4 5]).log(2)
[1 2 3 4 5]

>>> [2 4 8 16 32].reciprocal.log(2)
[-1 -2 -3 -4 -5]

>>> [2 4 8 16 32].log(1 / 2)
[-1 -2 -3 -4 -5]
```

Plot over a subset of the reals:

~~~spl svg=A
(0.01 -- 5).functionPlot(log:/1)
~~~

![](sw/spl/Help/Image/log-A.svg)

* * *

See also: exp, log2, log10, logarithmicIntegral

References:
_Apl_
[1](https://aplwiki.com/wiki/Logarithm),
_Dlmf_
[1](https://dlmf.nist.gov/4.2#i),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hatdot),
_Mathematica_
[1](https://mathworld.wolfram.com/Logarithm.html)
[2](https://reference.wolfram.com/language/ref/Log.html),
_Smalltalk_
5.6.7.9
5.6.7.10

Categories: Math
