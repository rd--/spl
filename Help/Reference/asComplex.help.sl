# asComplex

- _asComplex(anObject)_

In the `Complex` case answer `identity`.

```
>>> 1J1.asComplex
1J1
```

In the `Number` case answer a `Complex` number with a real part of _aNumber_ and an imaginary part of `zero`.

```
>>> 1.asComplex
1J0
```

In the two-element `List` case:

```
>>> [2 3].asComplex
2J3
```

* * *

See also: asFloat, asInteger, asNumber, i

Categories: Converting
