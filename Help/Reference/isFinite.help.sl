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
```

At `LargeInteger`:

```
>>> (23L ^ 23L).isFinite
true
```

At _not a number_, real and complex:

```
>>> NaN.isFinite
false

>>> (0 / 0).isFinite
false

>>> NaN.j(NaN).isFinite
false

>>> (0J0 / 0).isFinite
false
```

At `nil`,
signal an error:

```
>>> {
>>> 	nil.isFinite
>>> }.hasError
true
```

At `List`:

```
>>> [1.pi 23].isFinite
true

>>> [23 Infinity NaN].isFinite
false

>>> [23 Infinity NaN].collect(isFinite/1)
[true, false, false]
```

* * *

See also: /, allSatisfy, Infinity, isInteger, NaN, Number, SmallFloat, zero

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Finite.html)
[2](https://mathworld.wolfram.com/Infinite.html)
[3](https://mathworld.wolfram.com/ComplexInfinity.html),
_W_
[1](https://en.wikipedia.org/wiki/Infinity)

Categories: Arithmetic
