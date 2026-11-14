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

At `Integer`:

```
>>> 13.factorial.isPowerOfTwo
false

>>> (2L ^ 268_314L).isPowerOfTwo
true
```

Answers correctly for `Float` values that answer `false` for `isBinary`,
but `true` for `isSmallInteger`:

```
>>> (2 ^ 35).isBinary
false

>>> (2 ^ 35).isPowerOfTwo
true

>>> (2 ^ 35 - 1).isPowerOfTwo
false
```

It is an error if the `Float` is not a `SmallInteger`:

```
>>> {
>>> 	Float(2L ^ 672L).isPowerOfTwo
>>> }.hasError
true
```

* * *

See also: isDyadicRational, isPoliteNumber, nextPowerOfTwo, previousPowerOfTwo

Guides: Integer Functions, Mathematical Functions

Categories: Testing
