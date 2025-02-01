# Power

- _Power(aNumber, anotherNumber)_

Answer _aNumber_ raised to the power _anotherNumber_.

```
>>> Power(2, 3)
8
```

This method extends the usual definition of exponentiation,
and for negative _i_ in _Power(i, j)_ answers _Minus(Power(Minus(i), j))_.

This behavior allows exponentiation of negative signal values by non-integer exponents.

```
>>> -0.25.Power(0.75)
-0.353553
```

Compare with `^`:

```
>>> -0.25J0 ^ 0.75
-0.25J0.25
```

Plot:

~~~spl svg=A
-0.25.Power(
	[0, 0.01 .. 1]
).linePlot
~~~

![](sw/spl/Help/Image/Power-A.svg)

* * *

See also: ^, Exp, factorialPower, Log, powerMod, powerRange, Sqrt

Categories: Math operator
