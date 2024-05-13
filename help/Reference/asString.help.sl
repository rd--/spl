# asString

- _asString(anObject)_

Answer the _printString_ of the receiver,
unless it is a `String`, in which case answer the receiver itself,
or a `Character`, in which case answer a single character string.

At `SmallFloat`:

```
>>> 23.asString
'23'

>>> 3.141.asString
'3.141'
```

At `Fraction`:

```
>>> 2/3.asString
'2/3'
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
'1:99'
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

See also: printString, storeString, String

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TextString.html)

Categories: Converting, Printing
