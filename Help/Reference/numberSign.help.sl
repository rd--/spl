# \# (numberSign)

- _c.#_
- _n # x_

The unary form answers the `size` of the collection _c_:

```
>>> [1 2 3 4 5].#
5
```

The binary form makes _n_ copies of the object _x_.

With an `Integer` count of _n_,
makes _n_ copies of a scalar,
or _n_ copies of each element of a sequence.

A list that consists of three repeated five times:

```
>>> 5 # [3]
[3 3 3 3 3]
```

A list that consists of the string _x_ repeated three times:

```
>>> 3 # ['x']
['x' 'x' 'x']
```

A list that consists of two copies of each element of a sequence:

```
>>> 2 # [1 2 3]
[1 1 2 2 3 3]
```

A list that consists of three copies of each element of a sequence:

```
>>> 3 # [1 2 3 4]
[1 1 1 2 2 2 3 3 3 4 4 4]
```

If the count is `zero` answer the empty list:

```
>>> 0 # []
[]
```

With a `Sequence` count,
make the indicated number of copies of each element in turn:

```
>>> [5] # [3]
[3 3 3 3 3]

>>> [3 2 1] # [1 2 3]
[1 1 1 2 2 3]

>>> [2 2 3 3] # [1 2 3 4]
[1 1 2 2 3 3 3 4 4 4]
```

A zero count entry skips over the corresponding item

```
>>> [1 0 1] # [1 2 3]
[1 3]

>>> [0 1 1 0 2] # [1 2 3 4 5]
[2 3 5 5]
```

It is an `error` if the count is not integral:

```
>>> { 3.5 # 3 }.hasError
true
```

The name of this operator is `numberSign`.

* * *

See also: !, fill, replicateInteger, replicateEach, replicateEachApplying, reshape, shape, size

Guides: Binary Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number#dyadic),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/repelem.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.repeat.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-dupEach)
