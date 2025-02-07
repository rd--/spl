# *+ (asteriskPlusSign)

- _n.*+(m, a)_

Answer _(n * m) + a_.
In some cases this may be optimised as a fused multiply-add operator.

```
>>> 3.*+(4, 5)
17

>>> 3 * 4 + 5
17
```

Threads element-wise over lists:

```
>>> 2.*+([3 4 5], [6 7])
[12 15 16]

>>> 2 * [3 4 5] + [6 7]
[12 15 16]

>>> [3 4 5].*+([6 7], 8)
[26 36 38]

>>> [3 4 5] * [6 7] + 8
[26 36 38]
```

The name of this operator is `asteriskPlusSign`.

* * *

See also: +, *, MulAdd, Plus, Times

Categories: Arithmetic, Math, Operator, Syntax
