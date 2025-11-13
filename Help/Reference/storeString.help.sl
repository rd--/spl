# storeString

- _storeString(x)_

Answer a `String` representation of the object _x_ from which it can be reconstructed.

```
>>> let x = (1 -> 2);
>>> let s = x.storeString;
>>> (s, system.evaluate(s))
('Association(1, 2)', x)

>>> let x = (false -> true);
>>> let s = x.storeString;
>>> (s, system.evaluate(s))
('Association(false, true)', x)

>> ('+' -> 'plus')
>> .storeString
Association('+', 'plus')
```

* * *

See also: asString, printString, String

Guides: Parsing Functions, String Functions

Categories: Printing
