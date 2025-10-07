# factorialPower

- _factorialPower(x, n)_

Answer the factorial power _x^(n)_.

```
>>> 10.factorialPower(2)
90

>>> 4.factorialPower(2)
12

>>> 1:5.collect(factorialPower:/2.bind(4))
[4 12 24 24 0]
```

Plot over a subset of the reals:

~~~spl svg=A
(-0.5 -- 3.5).functionPlot(
	1:4.collect { :k |
		{ :each |
			each.factorialPower(k)
		}
	}
)
~~~

![](sw/spl/Help/Image/factorialPower-A.svg)

* * *

See also: ^, factorial, binomial, sum

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FallingFactorial.html)
[2](https://reference.wolfram.com/language/ref/FactorialPower.html)
