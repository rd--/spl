# printStringLimitedTo

- _printStringLimitedTo(anObject, anInteger)_

Truncate the `printString` of _anObject_ to _anInteger_ places.

```
>>> let x = [1 .. 99];
>>> let s = x.printStringLimitedTo(16);
>>> (s, s.size)
('[1, 2, 3... &etc', 16)
```

Note that the entire `printString` must first be generated.
To safely print an object use `concisePrintString`.

* * *

See also: asString, concisePrintString, printString, storeString

Categories: Printing
