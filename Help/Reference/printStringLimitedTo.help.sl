# printStringLimitedTo

- _printStringLimitedTo(x, n)_

Truncate the `printString` of the object _x_ to _n_ places.

```
>>> let x = [1.0 .. 99.0];
>>> let s = x.printStringLimitedTo(16);
>>> (s, s.size)
('[1.0, 2.... &etc', 16)
```

Note that the entire `printString` must first be generated.
To safely print an object use `abbreviatedPrintString`.

* * *

See also: concisePrintString, displayString, printString, storeString

Guides: Printing Functions

Categories: Printing
