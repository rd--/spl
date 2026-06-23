# \# (numberSign)

- _c.#_
- _n # x_

The unary case is the operator form of `size`:

```
>>> [1 2 3 4 5].#
5

>>> [1 2 3 4 5].size
5
```

The binary case is the operator form of `replicate`:

```
>>> 2 # 1:5
[1 1 2 2 3 3 4 4 5 5]

>>> 1:5 # 1:5
[1 2 2 3 3 3 4 4 4 4 5 5 5 5 5]

>>> 1:5.replicate(1:5)
[1 2 2 3 3 3 4 4 4 4 5 5 5 5 5]
```

Eight copies of each of sixteen random numbers:

~~~spl svg=A
let r = Sfc32(671834);
let x = r.randomReal([-1 1], [16]);
(8 # x).stepPlot
~~~

![](Help/Image/numberSign-A.svg)

The name of this operator is `numberSign`.

* * *

See also: !, replicate, size

Guides: Binary Operators, List Functions

Category: Operator
