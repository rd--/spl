# isPowerOfTwo

- _isPowerOfTwo(anInteger)_

Answers `true` if _anInteger_ is a power of two, else `false`.

```
>>> 8.isPowerOfTwo
true

>>> 1:999.select(isPowerOfTwo:/1)
[1 2 4 8 16 32 64 128 256 512]
```

At `Fraction`:

```
>>> [23/1 64/1].collect(isPowerOfTwo:/1)
[false true]
```

* * *

See also: asPowerOfTwo, nextPowerOfTwo

Categories: Testing
