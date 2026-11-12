# decimalStringToScale

- _decimalStringToScale(n, k)_

Answer a `String` representing the number _n_ in decimal to exactly _k_ decimal places.
The number of decimal place is called _scale_,
the number of places altogether is called _precision_.

Rounds up or down as required:

```
>>> 12345.6789
>>> .decimalStringToScale(1)
'12345.7'

>>> 2.49
>>> .decimalStringToScale(1)
'2.5'
```

Truncate irrational number:

```
>>> 2.pi
>>> .decimalStringToScale(5)
'6.28319'
```

Extend integer:

```
>>> 23.0
>>> .decimalStringToScale(5)
'23.00000'

>>> 23L
>>> .decimalStringToScale(3)
'23.000'
```

Extend simple fraction:

```
>>> Float(1/2)
>>> .decimalStringToScale(5)
'0.50000'
```

Negative fraction:

```
>>> Float(-23/27)
>>> .decimalStringToScale(4)
'-0.8519'
```

Truncate simple fraction:

```
>>> Float(1/3)
>>> .decimalStringToScale(5)
'0.33333'
```

At `Float`:

```
>>> 3.01507
>>> .decimalStringToScale(5)
'3.01507'

>>> 3.1416
>>> .decimalStringToScale(4)
'3.1416'
```

At `Complex`:

```
>>> 3.141J23
>>> .decimalStringToScale(5)
'3.14100J23.00000'

>>> 7.81907J3.01507
>>> .decimalStringToScale(5)
'7.81907J3.01507'
```

There is a limit to the number of decimal places that may be generated accurately:

```
>>> 0.3
>>> .decimalStringToScale(15)
'0.300000000000000'
```

Large numbers:

```
>>> 1.23E15
>>> .decimalStringToScale(2)
'1230000000000000.00'

>>> (123L * (10L ^ 13L))
>>> .decimalStringToScale(2)
'1230000000000000.00'
```

No fractional part, rounding up:

```
>>> 12345.6789
>>> .decimalStringToScale(0)
'12346'
```

* * *

See also: floatString, integerString, printString, decimalStringToPrecision, radixString, storeString

Guides: Printing Functions

Categories: Printing
