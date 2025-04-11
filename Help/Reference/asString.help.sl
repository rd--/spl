# asString

- _asString(anObject)_

Answer the `printString` of _anObject_,
unless it is a `String`, in which case answer the receiver itself,
or a `Character`, in which case answer a single character string.

At `SmallFloat`:

```
>>> 23.asString
'23'

>>> -23.asString
'-23'

>>> 3.141.asString
'3.141'

>>> -0.asString
'-0'
```

At `Fraction`:

```
>>> 2/3.asString
'2/3'
```

At `Complex`:

```
>>> 2J3.asString
'2J3'
```

At `Decimal`:

```
>>> -2.3D.asString
'-2.3D'

>>> -2.0D.asString
'-2.0D'

>>> -2D.asString
'-2D'
```

At `Residue`:

```
>>> 5Z12.asString
'5Z12'
```

At `Boolean`:

```
>>> true.asString
'true'

>>> false.asString
'false'
```

At `Nil`:

```
>>> nil.asString
'nil'
```

At `String`:

```
>>> 'x'.asString
'x'
```

At `Character`:

```
>>> 'x'.asCharacter.asString
'x'
```

At `List`:

```
>>> [1 .. 3].asString
'[1, 2, 3]'
```

At `Range`:

```
>>> 1:99.asString
'Range(1, 99, 1)'
```

At `Association`:

```
>>> (23 -> 3.141).asString
'23 -> 3.141'
```

At `Record`:

```
>>> (x: 1, y: 2).asString
'(x: 1, y: 2)'
```

* * *

See also: concisePrintString, printString, storeString, String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TextString.html)

Categories: Converting, Printing
