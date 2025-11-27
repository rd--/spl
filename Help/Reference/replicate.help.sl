# replicate

- _replicate(n, [x₁ x₂ …])_
- _replicate([n₁ n₂ …], [x₁ x₂ …])_

Replicate each element of the sequence _x_ the number of times indicated by _n_,
which in the list case must have the same number of places as _x_.

```
>>> let n = [2 3 4];
>>> let x = [1 3 5];
>>> n.replicate(x)
[1 1 3 3 3 5 5 5 5]
```

`#` is the operator form of `replicate`:

```
>>> let n = [2 3 4];
>>> let x = [1 3 5];
>>> n # x
[1 1 3 3 3 5 5 5 5]
```

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

The self counting sequence,
OEIS [A002024](https://oeis.org/A002024):

```
>>> 1:5 # 1:5
[1 2 2 3 3 3 4 4 4 4 5 5 5 5 5]
```

If _n_ is a scalar integer it re-written as a list:

```
>>> 3.replicate([1 3 5])
[1 1 1 3 3 3 5 5 5]

>>> [3 3 3].replicate([1 3 5])
[1 1 1 3 3 3 5 5 5]

>>> 3 # [1 3 5]
[1 1 1 3 3 3 5 5 5]
```

C.f. `duplicate`:

```
>>> { [1 3 5] }.duplicate(3)
[
	1 3 5;
	1 3 5;
	1 3 5
]
```

* * *

See also: !, #, duplicate, fill, reshape, shape

Guides: Copying Functions, List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number#dyadic),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/repelem.html),
_OEIS_
[1](https://oeis.org/A002024)
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.repeat.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-dupEach)

Categories: Copying
