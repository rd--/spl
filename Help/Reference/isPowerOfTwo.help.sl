# isPowerOfTwo

- _isPowerOfTwo(n)_

Answers `true` if the integer _n_ is a power of two, else `false`.

```
>>> 8.isPowerOfTwo
true

>>> 1:999.select(isPowerOfTwo/1)
[1 2 4 8 16 32 64 128 256 512]
```

At `zero`:

```
>>> 0.isPowerOfTwo
false
```

At `Fraction`:

```
>>> [23/1 64/1].collect(isPowerOfTwo/1)
[false true]
```

At `LargeInteger`:

```
>>> 13L.factorial.isPowerOfTwo
false
```

Answers correctly for `SmallFloat` values that answer `false` for `isBinary`:

```
>>> 13.factorial.isBinary
false

>>> 13.factorial.isPowerOfTwo
false
```

* * *

See also: asPowerOfTwo, isDyadicRational, isPoliteNumber, nextPowerOfTwo

Guides: Integer Functions, Mathematical Functions

Categories: Testing
