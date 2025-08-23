# isFinite

- _isFinite(x)_
- _isFinite([x₁ x₂ …])_

Answer true if the number _x_ is not infinite,
or if all items in the collection _x_ are finite.

```
>>> 1.pi.isFinite
true

>>> Infinity.isFinite
false

>>> { nil.isFinite }.ifError { true }
true
```

At `List`:

```
>>> [1.pi 23].isFinite
true

>>> [23, Infinity, 1.pi / 0].isFinite
false
```

* * *

See also: /, allSatisfy, Infinity, isInteger, Number, SmallFloat, zero

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Finite.html)
[2](https://mathworld.wolfram.com/Infinite.html)

Categories: Arithmetic
