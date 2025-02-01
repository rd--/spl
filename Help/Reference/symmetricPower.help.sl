# symmetricPower

- _symmetricPower(aNumber, anotherNumber)_

Answer _aNumber_ raised to the power _anotherNumber_.

```
>>> 2.symmetricPower(3)
8
```

This method extends the usual definition of exponentiation,
and for negative _i_ in _symmetricPower(i, j)_ answers _symmetricPower(i.-, j).-_.

This behavior allows exponentiation of negative signal values by non-integer exponents.

```
>>> -0.25.symmetricPower(0.75)
-0.353553

>>> 0.25.symmetricPower(0.75)
0.353553

>>> -0.25.symmetricPower(0)
-1

>>> 0.25.symmetricPower(0)
1
```

Compare with `^`:

```
>>> -0.25J0 ^ 0.75
-0.25J0.25

>>> 0.25 ^ 0.75
0.353553
```

Plot:

~~~spl svg=A
-0.25.symmetricPower(
	(0, 0.01 .. 1)
).linePlot
~~~

![](sw/spl/Help/Image/symmetricPower-A.svg)

* * *

See also: ^, exp, log, powerMod, powerRange, sqrt

Categories: Math
