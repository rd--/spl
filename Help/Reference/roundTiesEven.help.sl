# roundTiesEven

- _roundTiesEven(n)_

Answer _n_ rounded,
with half-way cases rounded to an even number.

```
>>> [0.5 1.5 2.5].roundTiesEven
[0 2 2]

>>> [3.3 -3.3 3.5 4.5].roundTiesEven
[3 -3 4 4]
```

Compare to `round`:

```
>>> [0.5 1.5 2.5].round
[1 2 3]

>>> [3.3 -3.3 3.5 4.5].round
[3 -3 4 5]
```

* * *

See also: round, roundTo

References:
_Rust_
[1](https://doc.rust-lang.org/std/primitive.f64.html#method.round_ties_even),
_W_
[1](https://en.wikipedia.org/wiki/Rounding)
