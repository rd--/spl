# storeString

- _storeString(x)_

Answer a `String` representation of the object _x_ from which it can be reconstructed.

At `Association`:

```
>>> (23.0 -> 3.141).storeString
'Association(23.0, 3.141)'

>> ('+' -> 'plus')
>> .storeString
Association('+', 'plus')
```

At `Boolean`:

```
>>> true.storeString
'true'

>>> false.storeString
'false'
```

At `Integer`:

```
>>> 254L.storeString
'254L'

>>> (2L ^ 37L).square.storeString
'18889465931478580854784L'
```

At `Fraction`:

```
>>> 59/61.storeString
'59/61'
```

At `List`:

```
>>> [-1L, 2.0, 3.141].storeString
'[-1L, 2.0, 3.141]'
```

At `Record`:

```
>>> (x: 1.0, y: 2.0).storeString
'(x: 1.0, y: 2.0)'
```

At `ByteArray`:

```
>>> ByteArray[1 2 3].storeString
'ByteArray([1.0, 2.0, 3.0])'
```

Store strings can be evaluated,
they are valid Spl expressions:

```
>>> let x = (1L -> 2.0);
>>> let s = x.storeString;
>>> (s, system.evaluate(s))
('Association(1L, 2.0)', x)

>>> let x = (false -> true);
>>> let s = x.storeString;
>>> (s, system.evaluate(s))
('Association(false, true)', x)
```

* * *

See also: Store, String, displayString, printString

Guides: Parsing Functions, Printing Functions, String Functions

Categories: Printing
