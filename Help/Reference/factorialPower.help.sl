# factorialPower

- _factorialPower(aNumber, anInteger)_

Answer the factorial power _aNumber ^ (anInteger)_.

```
>>> 10.factorialPower(2)
90

>>> 4.factorialPower(2)
12

>>> 1:5.collect(factorialPower:/2.bind(4))
[4 12 24 24 0]
```

Plot over a subset of the reals:

~~~
(-3 -- 4).functionPlot { :each | each.factorialPower(1) }
(-3 -- 4).functionPlot { :each | each.factorialPower(2) }
(-3 -- 4).functionPlot { :each | each.factorialPower(3) }
(-3 -- 4).functionPlot { :each | each.factorialPower(4) }
~~~

* * *

See also: ^, factorial, binomial, sum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FallingFactorial.html)
[2](https://reference.wolfram.com/language/ref/FactorialPower.html)
