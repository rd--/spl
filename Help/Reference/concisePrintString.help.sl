# concisePrintString

- _concisePrintString(x)_

Answer a concise string representation of the object _x_.

At integer `Float`:

```
>>> 23.0.concisePrintString
'23'

>>> -23.0.concisePrintString
'-23'

>>> -0.0.concisePrintString
'-0'
```

At fractional `Float`:

```
>>> 3.141.concisePrintString
'3.141'

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

At `Integer`:

```
>>> 23L.concisePrintString
'23'

>>> -23L.concisePrintString
'-23'
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

At `String`,
the string is quoted:

```
>> 'text'.concisePrintString
'text'
```

At `List`:

```
>>> [1L .. 10L].concisePrintString
'[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]'
```

* * *

See also: String, contractTo, displayString, printString, storeString

Guides: Printing Functions, String Functions

Categories: Printing
