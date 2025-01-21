# isFinite

- _isFinite(aNumber | aCollection)_

Answer true if _aNumber_ is not infinite,
or if all items in _aCollection_ are finite.

```
>>> pi.isFinite
true

>>> inf.isFinite
false

>>> { nil.isFinite }.ifError { true }
true
```

At `List`:

```
>>> [pi 23].isFinite
true

>>> [23, inf, pi / 0].isFinite
false
```

* * *

See also: /, allSatisfy, inf, isInteger, Number, SmallFloat, zero

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Finite.html)
[2](https://mathworld.wolfram.com/Infinite.html)

Categories: Arithmetic
