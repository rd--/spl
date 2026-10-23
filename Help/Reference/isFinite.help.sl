# isFinite

- _isFinite(x)_

Answer true if the number _x_ is not an `Infinity` or `NaN`.

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

At _not a number_:

```
>>> NaN.isFinite
false

>>> (0 / 0).isFinite
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

Threads over lists:

```
>>> [1.pi 23].isFinite
[true, true]

>>> [23 Infinity NaN].isFinite
[true, false, false]

>>> [23 Infinity NaN].allTrue(isFinite/1)
false
```

* * *

See also: Infinity, NaN, Number, SmallFloat, /, isInteger, replaceNaN, zero

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Finite.html)
[2](https://mathworld.wolfram.com/Infinite.html)
[3](https://mathworld.wolfram.com/ComplexInfinity.html),
_W_
[1](https://en.wikipedia.org/wiki/Infinity)

Categories: Arithmetic
