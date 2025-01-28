# logarithmicIntegral

- _logarithmicIntegral(aNumber)_

The logarithmic integral function.
Calculated using a series expansion due to Ramanujan,
with the limit set to nine.

```
>>> 2.logarithmicIntegral
1.0452

>>> [1.2, 1.5, 1.8].collect { :each |
>>> 	each.logarithmicIntegral
>>> }
[-0.933787, 0.125065, 0.732637]

>>> 0.5.logarithmicIntegral
-0.37867
```

At zero:

```
>>> 0.logarithmicIntegral
0
```

At one:

```
>>> 1.logarithmicIntegral.isFinite
false
```

Zero of:

```
>>> 1.451369.logarithmicIntegral
0
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 10).functionPlot { :x |
	let y = x.logarithmicIntegral;
	y.clip(-5, Infinity)
}
~~~

![](sw/spl/Help/Image/logarithmicIntegral-A.svg)

* * *

See also: log, logarithmicIntegralRamanujan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogarithmicIntegral.html)
[2](https://reference.wolfram.com/language/ref/LogIntegral.html)

Categories: Math
