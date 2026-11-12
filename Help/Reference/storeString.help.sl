# storeString

- _storeString(x)_

Answer a `String` representation of the object _x_ from which it can be reconstructed.

At `Association`:

```
>>> let x = (1L -> 2.0);
>>> let s = x.storeString;
>>> (s, system.evaluate(s))
('Association(1L, 2.0)', x)

>>> let x = (false -> true);
>>> let s = x.storeString;
>>> (s, system.evaluate(s))
('Association(false, true)', x)

>> ('+' -> 'plus')
>> .storeString
Association('+', 'plus')
```

* * *

See also: Store, String, displayString, printString

Guides: Parsing Functions, Printing Functions, String Functions

Categories: Printing
