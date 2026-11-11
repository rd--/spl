# printString

- _printString(x)_

Answer a `String` that is a description of the object _x_.

At integer `Float`:

```
>>> 23.0.printString
'23'

>>> -23.0.printString
'-23'
```

At fractional `Float`:

```
>>> 3.141.printString
'3.141'
```

At `Integer`,
without radix argument:

```
>>> 254L.printString
'254L'
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

>>> -2.3D.printString
'-2.3D'

>>> -2.0D.printString
'-2.0D'

>>> -2D.printString
'-2D'
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

At `Fraction`:

```
>>> 2/3.printString
'2/3'
```

At `Residue`:

```
>>> 5Z12.printString
'5Z12'
```

In the case that the object is a small integer,
to specify the radix _r_ see `radixString` and `floatString`:

```
>>> 23.0.radixString(2)
'2b10111'

>>> 23.0.floatString(2)
'10111.0'
```

In the case that the object is a floating point number,
to specify the precision or scale see `printStringToPrecision` and `printStringToFixed`:

At `Float` with precision:

```
>>> 1.pi.printStringToPrecision(4)
'3.142'

>>> 1.pi.printStringToFixed(3)
'3.142'
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
>> 'x'.printString
'x'

>>> 'x'.printString != 'x'.displayString
true
```

At `Character`:

```
>> Character('x').printString
Character('x', 120)
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

At `Range`:

```
>>> 1:99.printString
'Range(1, 99, 1, 99)'
```

* * *

See also: String, concisePrintString, displayString, integerString, printLine, storeString

Guides: Printing Functions, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToString.html)
[2](https://reference.wolfram.com/language/ref/BaseForm.html),
_Smalltalk_
5.3.1.18,
_W_
[1](https://en.wikipedia.org/wiki/Radix)

Categories: Printing
