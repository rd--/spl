# concisePrintString

- _concisePrintString(x)_

Answer a concise string representation of the object _x_.

Generic implementation at `Collection`:

```
>>> ByteArray(100).concisePrintString
'a ByteArray (size: 100)'
```

At `SmallFloat`:

```
>>> 3.141.concisePrintString
'3.141'

>>> 23.concisePrintString
'23'

>>> 1E-19.concisePrintString
'1E-19'
```

At `Complex`:

```
>>> 3J4.concisePrintString
'3J4'

>>> 3I.concisePrintString
'3I'

>>> 3J0.concisePrintString
'3'
```

At `Nil`:

```
>>> nil.concisePrintString
'nil'
```

At `Boolean`:

```
>>> true.concisePrintString
'true'
```

At `Interval`:

```
>>> (1 -- 9).concisePrintString
'(1 -- 9)'
```

At `Range`:

```
>>> 1:9.concisePrintString
'1:9'
```

At `Tuple`:

```
>>> (1, 3, 5, 7, 9).concisePrintString
'(1, 3, 5, 7, 9)'
```

At `String`:

```
>>> 'short text'.concisePrintString
'short text'

>>> 'a text that is rather a lot longer'
>>> .concisePrintString
'a text that is ...r a lot longer'
```

At `List`:

```
>>> [1 .. 100].concisePrintString
'a List (size: 100)'
```

* * *

See also: asString, contractTo, printString, storeString

Guides: String Functions

Categories: Printing
