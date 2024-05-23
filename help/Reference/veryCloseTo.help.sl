# veryCloseTo

- _veryCloseTo(aNumber, anotherNumber)_

Answer `true` if _aNumber_ is very close to _anotherNumber_, else `false`.

```
>>> 1.veryCloseTo(1.0000000000001)
true
```

Operates over vectors, matrices and arrays:

```
>>> [1 2 3].veryCloseTo([1 2 3] + 1/2.epsilon)
true
```

* * *

See also: =, ~, closeTo, epsilon

Categories: Comparing
