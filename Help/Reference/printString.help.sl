# printString

- _printString(anObject)_
- _printString(anInteger, radix)_

Answer a `String` that is a description of the receiver.

At `Integer`:

```
>>> 23.printString
'23'
```

At `SmallFloat` with radix argument:

```
>>> 254.printString(16)
'FE'
```

At `LargeInteger` with radix argument:

```
>>> 254n.printString(16)
'FE'
```

Negative zero is printed as it is typed:

```
>>> -0.printString
'-0'
```

At `SmallFloat`:

```
>>> 3.141.printString
'3.141'
```

At `Fraction`:

```
>>> 2/3.printString
'2/3'
```

At `Boolean`:

```
>>> true.printString
'true'

>>> false.printString
'false'
```

At `Nil`:

```
>>> nil.printString
'nil'
```

At `String`, the string is quoted:

```
>>> 'x'.printString.size
3

>>> 'x'.printString ~= 'x'.asString
true
```

At `List`:

```
>>> [1 .. 3].printString
'[1, 2, 3]'
```

At `Record`:

```
>>> (x: 23, y: 3.141).printString
'(x: 23, y: 3.141)'
```

At `Association`:

```
>>> (23 -> 3.141).printString
'23 -> 3.141'
```

* * *

See also: asString, conciseString, postLine, printStringShowingDecimalPlaces, storeString

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToString.html),
_Smalltalk_
5.3.1.18

Categories: Printing
