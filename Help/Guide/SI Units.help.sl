# SI Units

A metric prefix is a unit prefix that precedes a basic unit of measure to indicate a multiple or submultiple of the unit.

```
>>> [
>>> 	1.pico 1.nano 1.micro
>>> 	1.milli 1.centi 1.deci
>>> 	1.deca 1.hecto 1.kilo
>>> 	1.mega 1.giga 1.terra
>>> ]
[
	1E-12 1E-9 1E-6
	1E-3 1E-2 1E-1
	1E1 1E2 1E3
	1E6 1E9 1E12
]
```

Unlike scientific literals,
which always answer `SmallFloat` values,
the SI prefix methods can answer `LargeInteger` values:

```
>>> [1n.kilo 1n.mega 1n.giga 1n.terra]
[1000n 1000000n 1000000000n 1000000000000n]
```

* * *

See also: centi, deci, deca, hecto, giga, kilo, mega, micro, milli, nano, pico, terra

References:
_W_
[1](https://en.wikipedia.org/wiki/Metric_prefix)
