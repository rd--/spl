# absSquared

- _absSquared(x)_

Answer the square of the absolute value of the number _x_.

At `SmallFloat`:

```
>>> -3.absSquared
9
```

At `Complex`:

```
>>> 3J4.absSquared
25
```

Threads over lists:

```
>>> [1J2 3J4].absSquared.sum
30
```

* * *

See also: abs, Complex, square

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.abs2)
