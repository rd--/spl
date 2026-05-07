# FiniteRange

- _FiniteRange([i j k n])_

`FiniteRange` answers a finite `Range` value representing a finite arithmetic progression,
ranging from _i_ to _j_ by step _k_ and having _n_ places.

```
>>> let r = FiniteRange([1 10 1 10]);
>>> (r.start, r.stop, r.step, r.size, r.asList)
(1, 10, 1, 10, [1 2 3 4 5 6 7 8 9 10])
```

Compare to ternary form of `Range`:

```
>>> let k = 1 / (100 - 1);
>>> let r = FiniteRange(0, 1, k, 100);
>>> (r.size, r.step, r.last)
(100, 0.010101, 1)

>>> let k = 1 / (100 - 1);
>>> let r = Range(0, 1, k);
>>> (r.size, r.step, r.last)
(99, 0.010101, 0.989898)

>>> let k = 1 / (100 - 1);
>>> (1 / k, 1.quotient(k))
(98.999999, 98)
```

_Rationale_:
The `Range` type allows for specifying infinite sequences,
and for the specification of finite sequences to omit the sequence size.
Due to floating point imprecision it is not possible to ensure that the inferred size of a `Range` will be equal to the size used to calculate the `step` value.
There is a quaternary `Range` form however it also allows infinite and improper `Range` values.

* * *

See also: ArithmeticProgression, Range

Guides: Range Syntax, Range Literal Syntax
