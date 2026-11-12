# isVeryClose

- _isVeryClose(n, m)_

Answer `true` if a number _n_ is very close to another number _m_, else `false`.

```
>>> let x = 1.0;
>>> let y = 1.0000000000001;
>>> x.isVeryClose(y)
true
```

At `Fraction` and `Integer`:

```
>>> 3/1.isVeryClose(3L)
true

>>> 3L.isVeryClose(3/1)
true
```

Operates over vectors, matrices and arrays:

```
>>> [1 2 3].isVeryClose(
>>> 	[1 2 3] + 1/2.epsilon
>>> )
true
```

* * *

See also: =, ~, epsilon, isClose, isCloseBy, threshold

Guides: Comparison Functions
