# printString

- _printString(x, r=10, k=∞)_

Answer a `String` that is a description of the object _x_.
In the case that the object is an integer the radix _r_ may be specified.
In the case that the object is a floating point number the precision _k_ may be specified.

At integer `SmallFloat`:

```
>>> 23.printString
'23'
```

At `SmallFloat` with radix argument,
the answer is a valid Sᴘʟ expression:

```
>>> 254.printString(16)
'16rFE'

>>> -42.printString(16)
'-16r2A'

>>> system.evaluate('-16r2A')
-42
```

At `LargeInteger`,
with and without radix argument:

```
>>> 254L.printString
254L

>>> 254L.printString(16)
'16rFE'
```

At `Complex`:

```
>>> 1J2.printString
'1J2'

>>> 1J0.printString
'1J0'

>>> 0J1.printString
'0J1'

>>> 1I.printString
'0J1'
```

At `Decimal`:

```
>>> 3.142D.printString
'3.142D'
```

At `SmallFloat` with precision:

```
>>> 1.pi.printString(10, 3)
3.142
```

Negative zero is printed as it is typed:

```
>>> -0.printString
'-0'
```

Infinities and non-numbers:

```
>>> Infinity.printString
'Infinity'

>>> -Infinity.printString
'-Infinity'

>>> NaN.printString
'NaN'
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

>>> 'x'.printString != 'x'.asString
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

See also: asString, concisePrintString, postLine, printStringShowingDecimalPlaces, storeString

Guides: String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToString.html),
_Smalltalk_
5.3.1.18

Categories: Printing
