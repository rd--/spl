# storeString

- _storeString(anObject)_

Answer a String representation of _anObject_ from which it can be reconstructed.

```
>>> (1 -> 2)
system.evaluate((1 -> 2).storeString)

>>> (false -> true)
system.evaluate((false -> true).storeString)

>>> ('+' -> 'plus')
system.evaluate(('+' -> 'plus').storeString)
```

* * *

See also: asString, printString, String

Categories: Printing
