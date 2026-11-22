# factorialNumberSystemDecode

- _factorialNumberSystemDecode(n)_

Decode the integer _n_ from the factorial number system.

Decode _34101_:

```
>>> 34101L.factorialNumberSystemDecode
463L

>>> ([3L 4L 1L 0L 1L] * [5L 4L 3L 2L 1L].!).sum
463L
```

The inverse is `factorialNumberSystemEncode`:

```
>>> 463L.factorialNumberSystemEncode
34101L
```

* * *

See also: factorial, factorialExpansion, factorialNumberSystemEncode

Guides: Mathematical Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Factorial_number_system)
