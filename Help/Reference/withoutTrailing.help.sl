# withoutTrailing

- _withoutTrailing([x₁ x₂ …], f:/1)_

At `List`,
answer a `List` that is like the list _x_ but without any trailing values that satisfy the predicate block _f_.

Remove all trailing zeroes:

```
>>> [1 1 0 0 0].withoutTrailing(isZero:/1)
[1 1]
```

A leading zero is not a trailing zero:

```
>>> [0 0 0].withoutTrailing(isZero:/1)
[0]
```

* * *

See also: isZero

Guides: List Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Trailing_zero)
