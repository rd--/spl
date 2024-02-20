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

```
(-3, -2.99 .. 4).collect { :each | each.factorialPower(1) }.plot
(-3, -2.99 .. 4).collect { :each | each.factorialPower(2) }.plot
(-3, -2.99 .. 4).collect { :each | each.factorialPower(3) }.plot
(-3, -2.99 .. 4).collect { :each | each.factorialPower(4) }.plot
```

* * *

See also: ^, factorial, binomialCoefficient, sum

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FallingFactorial.html)
[2](https://reference.wolfram.com/language/ref/FactorialPower.html)
