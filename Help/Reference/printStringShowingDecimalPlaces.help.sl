# printStringShowingDecimalPlaces

- _printStringShowingDecimalPlaces(n, k)_

Answer a `String` representing the number _n_ in decimal to exactly _k_ places.

Rounds up or down as required:

```
>>> 12345.6789
>>> .printStringShowingDecimalPlaces(1)
'12345.7'

>>> 2.49
>>> .printStringShowingDecimalPlaces(1)
'2.5'
```

Truncate irrational number:

```
>>> 2.pi
>>> .printStringShowingDecimalPlaces(5)
'6.28319'
```

Extend integer:

```
>>> 23
>>> .printStringShowingDecimalPlaces(5)
'23.00000'
```

Extend simple fraction:

```
>>> 1/2
>>> .printStringShowingDecimalPlaces(5)
'0.50000'
```

Negative fraction:

```
>>> -23/27
>>> .printStringShowingDecimalPlaces(4)
'-0.8519'
```

Truncate simple fraction:

```
>>> 1/3
>>> .printStringShowingDecimalPlaces(5)
'0.33333'
```

At `SmallFloat`:

```
>>> 3.01507
>>> .printStringShowingDecimalPlaces(5)
'3.01507'

>>> 3.1416
>>> .printStringShowingDecimalPlaces(4)
'3.1416'
```

At `Complex`:

```
>>> 3.141J23
>>> .printStringShowingDecimalPlaces(5)
'3.14100J23.00000'

>>> 7.81907J3.01507
>>> .printStringShowingDecimalPlaces(5)
'7.81907J3.01507'
```

There is a limit to the number of decimal places that may be generated accurately:

```
>>> 0.3
>>> .printStringShowingDecimalPlaces(21)
'0.300000000000000000000'
```

Large numbers:

```
>>> 1.23E20
>>> .printStringShowingDecimalPlaces(2)
'123000000000000000000.00'
```

No fractional part, rounding up:

```
>>> 12345.6789
>>> .printStringShowingDecimalPlaces(0)
'12346'
```

* * *

See also: asString, printString, printStringToFixed, printStringToPrecision, storeString

Guides: Printing Functions

Categories: Printing
