# printStringShowingDecimalPlaces

- _printStringShowingDecimalPlaces(aNumber, anInteger)_

Answer a `String` representing _aNumber_ in decimal to exactly _anInteger_ places.

Truncate irrational number:

```
>>> 2.pi.printStringShowingDecimalPlaces(5)
'6.28319'
```

Extend integer:

```
>>> 23.printStringShowingDecimalPlaces(5)
'23.00000'
```

Extend simple fraction:

```
>>> 1/2.printStringShowingDecimalPlaces(5)
'0.50000'
```

Negative fraction:

```
>>> -23/27.printStringShowingDecimalPlaces(4)
-0.8519
```

Truncate simple fraction:

```
>>> 1/3.printStringShowingDecimalPlaces(5)
'0.33333'
```

At `SmallFloat`:

```
>>> 3.01507.printStringShowingDecimalPlaces(5)
'3.01507'

>>> 3.1416.printStringShowingDecimalPlaces(4)
'3.1416'
```

At `Complex`:

```
>>> 3.141J23.printStringShowingDecimalPlaces(5)
'3.14100J23.00000'

>>> 7.81907J3.01507.printStringShowingDecimalPlaces(5)
'7.81907J3.01507'
```

* * *

See also: asString, printString, storeString

Categories: Printing
