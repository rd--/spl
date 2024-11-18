# logarithmicIntegralRamanujan

- _logarithmicIntegralRamanujan(aNumber, anInteger)_

The logarithmic integral function.

```
>>> 2.logarithmicIntegralRamanujan(9)
1.0452

>>> [1.2, 1.5, 1.8].collect { :each | each.logarithmicIntegralRamanujan(9) }
[-0.933787, 0.125065, 0.732637]

>>> 20.logarithmicIntegralRamanujan(99)
9.9053

>>> 0.5.logarithmicIntegralRamanujan(9)
-0.37867
```

At zero:

```
>>> 0.logarithmicIntegralRamanujan(9)
0
```

At one:

```
>>> 1.logarithmicIntegralRamanujan(9).isFinite
false
```

Zero of:

```
>>> 1.451369.logarithmicIntegralRamanujan(9)
0
```

Plot over a subset of the reals:

~~~
(0 -- 10).functionPlot { :x |
	x.logarithmicIntegralRamanujan(9).clip(-5, inf)
}
~~~

* * *

See also: log

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogarithmicIntegral.html)
[2](https://reference.wolfram.com/language/ref/LogIntegral.html)

Categories: Math
