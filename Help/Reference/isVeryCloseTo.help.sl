# isVeryCloseTo

- _isVeryCloseTo(n, m)_

Answer `true` if a number _n_ is very close to another number _m_, else `false`.

```
>>> 1.isVeryCloseTo(1.0000000000001)
true
```

Operates over vectors, matrices and arrays:

```
>>> [1 2 3].isVeryCloseTo(
>>> 	[1 2 3] + 1/2.epsilon
>>> )
true
```

* * *

See also: =, ~, epsilon, isCloseTo, isCloseToBy, threshold

Categories: Comparing
