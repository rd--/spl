# printString

- _printString(x)_

Answer a `String` that is a description of the object _x_.

At integer `Float`:

```
>>> 23.0.printString
'23.0'

>>> -23.0.printString
'-23.0'
```

At fractional `Float`:

```
>>> 3.141.printString
'3.141'

(1 / 2).printString = '0.5' /* division prints as floating point */

```

At `Integer`,
positive and negative values:

```
>>> 254L.printString
'254L'

>>> -987654321L.printString
'-987654321L'

>>> 1E20.printString
'100000000000000000000L'

>>> (2L ^ 53L - 1L).square.printString
'81129638414606663681390495662081L'
```

At `Fraction`:

```
>>> 23/7.printString
'23/7'

>>> (1L / 2L).printString
'1/2'
```

At `Complex`:

```
>>> 1.0J2.0.printString
'1.0J2.0'

>>> 1.0J0.0.printString
'1.0J0.0'

>>> 0.0J1.0.printString
'0.0J1.0'

>>> 1.0I.printString
'0.0J1.0'
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
>>> -0.0.printString
'-0.0'
```

Infinities and non-numbers:

```
>>> Infinity.printString
'Infinity'

>>> (0.0 - Infinity).printString
'-Infinity'

>>> -Infinity.printString
'-Infinity'

>>> NaN.printString
'NaN'
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
to specify the precision or scale see `decimalStringToPrecision` and `decimalStringToScale`:

At `Float` with precision:

```
>>> 1.pi.decimalStringToPrecision(4)
'3.142'

>>> 1.pi.decimalStringToScale(3)
'3.142'
```

At `Interval`:

```
>>> (1.0 -- 9.0).printString
'(1.0 -- 9.0)'
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

>>> 'x'.printString
>>> !=
>>> 'x'.displayString
true
```

At `Character`:

```
>> Character('x').printString
Character('x', 120L)
```

At `List`:

```
>>> [1.0, 2.0, 3.0].printString
'[1.0, 2.0, 3.0]'

>>> [1L, 2L, 3L].printString
'[1L, 2L, 3L]'

>>> [-1L, 2.0, 3.141].printString
'[-1L, 2.0, 3.141]'
```

At `Record`:

```
>>> (x: 23.0, y: 3.141).printString
'(x: 23.0, y: 3.141)'
```

At `Association`:

```
>>> (23.0 -> 3.141).printString
'23.0 -> 3.141'
```

At `Range`:

```
>>> Range(1L, 99L, 1L).printString
'Range(1L, 99L, 1L, 99L)'

>>> Range(-1L, 1L, 1L).printString
'Range(-1L, 1L, 1L, 3L)'

>>> Range(-1.0, 1.0, 1.0).printString
'Range(-1.0, 1.0, 1.0, 3L)'
```

At `Function`:

```
>>> { }.printString
'a Function'

>>> { :x | x }.printString
'a Function'
```

At `ByteArray`:

```
>>> ByteArray([1, 2, 3]).printString
'ByteArray([1.0, 2.0, 3.0])'
```

At `Float64Array`:

```
>>> Float64Array([1.0, 2.0, 3.0])
>>> .printString
'Float64Array([1.0, 2.0, 3.0])'
```

* * *

See also: String, concisePrintString, displayString, floatString, integerString, printLine, storeString

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
