# FiniteRange

- _FiniteRange([i j k n])_

A `FiniteRange` is a `Type` that represents a finite arithmetic progression,
ranging from _i_ to _j_ by step _k_ and having _n_ places.

```
>>> let r = FiniteRange([1 10 1 10]);
>>> (r.start, r.stop, r.step, r.size, r.asList)
(1, 10, 1, 10, [1 2 3 4 5 6 7 8 9 10])
```

Compare to `Range`:

```
>>> let k = 1 / (100 - 1);
>>> let r = FiniteRange(0, 1, k, 100);
>>> (r.size, r.last)
(100, 1)

>>> let k = 1 / (100 - 1);
>>> let r = Range(0, 1, k);
>>> (r.size, r.last)
(99, 0.989898)
```

* * *

See also: ArithmeticProgression, Range

Guides: Range Syntax, Range Literal Syntax
