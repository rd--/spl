# pochhammer

- _pochhammer(a, n)_

Answer the Pochhammer symbol _(a)ₙ_,
also called the rising factorial.

Evaluate at integers:

```
>>> pochhammer(10, 6)
3603600

>>> pochhammer(-4, 2)
12

>>> pochhammer(0, 1285)
0

>>> [1 .. 5].collect { :a |
>>> 	pochhammer(a, 2)
>>> }
[2 6 12 20 30]
```

Evaluate at reals:

```
>>> pochhammer(2.4, 8.5)
2.31022E6

>>> pochhammer(1.5, 0.5)
2 / 1.pi.sqrt

>>> pochhammer(1 / 3, 7)
505.97165
```

Evaluate at `Complex`:

```
>>> pochhammer(2J5, 0J8)
Complex(2.13868E-6, 1.42187E-6)
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.5 -- 4).functionPlot { :x |
	pochhammer(x, 0.5).clip([-1.5 2])
}
~~~

![](sw/spl/Help/Image/pochhammer-A.svg)

Plot over a subset of the complexes:

~~~spl png=B
[-2J-2 2J2].complexPlot { :a |
	pochhammer(a, 2)
}
~~~

![](sw/spl/Help/Image/pochhammer-B.png)

Plot the Pochhammer function for various orders:

~~~spl svg=C
(-4 -- 4).functionPlot(
	[1 2 3 4].collect { :n |
		{ :a |
			pochhammer(a, n)
			.clip([-30 50])
		}
	}
)
~~~

![](sw/spl/Help/Image/pochhammer-C.svg)

Plot the Pochhammer function varying _a_:

~~~spl svg=D
(-6 -- 2).functionPlot(
	[0 1 2 3 4].collect { :a |
		{ :n |
			pochhammer(a, n)
			.clip([-5 6])
		}
	}
)
~~~

![](sw/spl/Help/Image/pochhammer-D.svg)

* * *

See also: beta, binomial, gamma, factorial, factorialPower

Guides: Combinatorial Functions, Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PochhammerSymbol.html)
[2](https://reference.wolfram.com/language/ref/Pochhammer.html),
_W_
[1](https://en.wikipedia.org/wiki/Falling_and_rising_factorials)
