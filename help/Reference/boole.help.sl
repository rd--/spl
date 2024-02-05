# boole

_boole(anObject)_

Answer 1 if _anObject_ is true and 0 if it is false.

```
>>> [false.boole, true.boole]
[0 1]
```

Threads over lists, convert a list of truth values to integers:

```
>>> [true false true true false].boole
[1 0 1 1 0]
```

The inverse of boole:

```
>>> [1 0 1 1 0].collect(asBoolean:/1)
[true false true true false]
```

* * *

See also: asBit, asBoolean, asInteger

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Boole.html)

