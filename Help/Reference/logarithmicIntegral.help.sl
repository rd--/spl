# logarithmicIntegral

- _logarithmicIntegral(n)_

The logarithmic integral function for the number _n_,
usually written _Li(n)_.
Calculated using a series expansion due to Ramanujan,
with the limit set to nine.

```
>>> [1.2, 1.5, 1.8].collect { :each |
>>> 	each.logarithmicIntegral
>>> }
[-0.933787, 0.125065, 0.732637]

>>> 0.5.logarithmicIntegral
-0.37867
```

At two,
OEIS [A069284](https://oeis.org/A069284):

```
>>> 2.logarithmicIntegral
1.045163
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

The zero is at Soldner’s constant,
OEIS [A070769](https://oeis.org/A070769):

```
>>> 1.451369.logarithmicIntegral
0
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 10).functionPlot { :x |
	let y = x.logarithmicIntegral;
	y.clip([-5 Infinity])
}
~~~

![](sw/spl/Help/Image/logarithmicIntegral-A.svg)

* * *

See also: eulerGamma, log, logarithmicIntegralRamanujan

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LogarithmicIntegral.html)
[2](https://reference.wolfram.com/language/ref/LogIntegral.html),
_OEIS_
[1](https://oeis.org/A070769)
[2](https://oeis.org/A069284),
_W_
[1](https://en.wikipedia.org/wiki/Logarithmic_integral_function)

Categories: Math
