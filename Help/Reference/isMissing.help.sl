# isMissing

- _isMissing(x)_

Answer `true` if _x_ is a missing value.

Numbers are not missing:

```
>>> [1 3.141 4/3 3.141D 3J4]
>>> .collect(isMissing/1)
[false, false, false, false, false]
```

`NaN` and `nil` are missing,
`Infinity` is not:

```
>>> [NaN nil Infinity]
>>> .collect(isMissing/1)
[true true false]
```

`Missing` values are missing:

```
>>> Missing('Invalid').isMissing
true
```

* * *

See also: Infinity, Missing, NaN, Nil

Guides: Error Functions, Predicate Functions
