# \# (numberSign)

- _#(aCollection)_
- _anObject # (anInteger | aSequence)_

The unary form answers the `size` of _aCollection_:

```
>>> 1:5.#
5
```

The binary form makes copies of _anObject_.

With an `Integer` count of _n_,
makes _n_ copies of a scalar,
or _n_ copies of each element of a sequence.

A list that consists of three repeated five times:

```
>>> 3 # 5
[3 3 3 3 3]
```

A list that consists of the string _x_ repeated three times:

```
>>> 'x' # 3
['x' 'x' 'x']
```

A list that consists of two copies of each element of a sequence:

```
>>> 1:3 # 2
[1 1 2 2 3 3]
```

A list that consists of three copies of each element of a sequence:

```
>>> 1:4 # 3
[1 1 1 2 2 2 3 3 3 4 4 4]
```

If the count is `zero` answer the empty list:

```
>>> nil # 0
[]
```

With a `Sequence` count,
make the indicated number of copies of each element in turn:

```
>>> [3] # [5]
[3 3 3 3 3]

>>> 1:3 # 3:-1:1
[1 1 1 2 2 3]

>>> 1:4 # [2 2 3 3]
[1 1 2 2 3 3 3 4 4 4]
```

A zero count entry skips over the corresponding item

```
>>> 1:3 # [1 0 1]
[1 3]

>>> 1:5 # [0 1 1 0 2]
[2 3 5 5]
```

It is an `error` if the count is not integral:

```
>>> { 3 # 3.5 }.ifError { true }
true
```

The name of this operator is `numberSign`.

* * *

See also: !, fill, replicateInteger, replicateEach, replicateEachApplying, reshape, shape, size

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number#dyadic),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/repelem.html)
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-dupEach)
