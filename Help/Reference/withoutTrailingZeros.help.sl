# withoutTrailingZeros

- _withoutTrailingZeros([x₁ x₂ …])_

Answer a `List` that is like the list _x_ but without any trailing zeros.

Remove all trailing zeros:

```
>>> [1 1 0 0 0].withoutTrailingZeros
[1 1]
```

A leading zero is not a trailing zero:

```
>>> [0 0 0].withoutTrailingZeros
[0]
```

* * *

See also: isZero
