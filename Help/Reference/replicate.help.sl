# replicate

- _replicate([x₁ x₂ …], n)_
- _replicate([x₁ x₂ …], [n₁ n₂ …])_

Replicate each element of the sequence _x_ the number of times indicated by _n_,
which in the list case must have the same number of places as _x_.
Where _n_ is required to be either `zero` or `one` replicate is also called compress.
The operator form is `#`.

```
>>> [1 3 5].replicate(2)
[1 1 3 3 5 5]

>>> let x = [1 3 5];
>>> let n = [2 3 4];
>>> x.replicate(n)
[1 1 3 3 3 5 5 5 5]
```

`#` is the operator form of `replicate`:

```
>>> let x = [1 3 5];
>>> let n = [2 3 4];
>>> x # n
[1 1 3 3 3 5 5 5 5]
```

_n_ appears _n_ times,
OEIS [A002024](https://oeis.org/A002024):

```
>>> 0:5 # 0:5
[1 2 2 3 3 3 4 4 4 4 5 5 5 5 5]
```

A list that consists of three repeated five times:

```
>>> [3] # 5
[3 3 3 3 3]
```

A list that consists of the string _x_ repeated three times:

```
>>> ['x'] # 3
['x' 'x' 'x']
```

A list that consists of two copies of each element of a sequence:

```
>>> [1 2 3] # 2
[1 1 2 2 3 3]
```

A list that consists of three copies of each element of a sequence:

```
>>> [1 2 3 4] # 3
[1 1 1 2 2 2 3 3 3 4 4 4]
```

If the count is `zero` answer the empty list:

```
>>> [] # 0
[]

>>> [] # []
[]
```

With a `Sequence` count,
make the indicated number of copies of each element in turn:

```
>>> [3] # [5]
[3 3 3 3 3]

>>> [1 2 3] # [3 2 1]
[1 1 1 2 2 3]

>>> [1 2 3 4] # [2 2 3 3]
[1 1 2 2 3 3 3 4 4 4]
```

A zero count entry skips over the corresponding item

```
>>> [1 2 3] # [1 0 1]
[1 3]

>>> [1 2 3 4 5] # [0 1 1 0 2]
[2 3 5 5]
```

A `boole` mask is a form of select:

```
>>> 1:9.select(isEven/1)
[2 4 6 8]

>>> let y = [1 .. 9];
>>> let x = y.collect(isEven/1).boole;
>>> (x, y # x)
([0 1 0 1 0 1 0 1 0], [2 4 6 8])

>>> 1:9.select { :x | x % 3 > 0 }
[1 2 4 5 7 8]

>>> let y = [1 .. 9];
>>> let x = (y % 3 > 0).boole;
>>> y # x
[1 2 4 5 7 8]
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

Positive integers repeated.
OEIS [A008619](https://oeis.org/A008619):

```
>>> 1:7 # 2
[1 1 2 2 3 3 4 4 5 5 6 6 7 7]
```

Odd numbers repeated,
OEIS [A109613](https://oeis.org/A109613):

```
>>> 1:13:2 # 2
[1 1 3 3 5 5 7 7 9 9 11 11 13 13]
```

Even numbers repeated,
OEIS [A052928](https://oeis.org/A052928):

```
>>> 0:12:2 # 2
[0 0 2 2 4 4 6 6 8 8 10 10 12 12]
```

_2^n_ repeated _2^(n-1)_ times,
OEIS [A062383](https://oeis.org/A062383):

```
>>> let n = 1:4;
>>> (2 ^ n) # (2 ^ (n - 1))
[2 4 4 8 8 8 8 16 16 16 16 16 16 16 16]
```

Nonnegative integers repeated four times,
OEIS [A002265](https://oeis.org/A002265):

```
>>> 1:5 # 4
[1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5]
```

If _n_ is a scalar integer it re-written as a list:

```
>>> [1 3 5].replicate(3)
[1 1 1 3 3 3 5 5 5]

>>> [1 3 5].replicate([3 3 3])
[1 1 1 3 3 3 5 5 5]

>>> [1 3 5] # 3
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

See also: !, #, duplicate, fill, repeat, reshape, shape

Guides: Copying Functions, List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number#dyadic)
[2](https://www.jsoftware.com/help/dictionary/d400.htm),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/repelem.html),
_OEIS_
[1](https://oeis.org/A002024)
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.repeat.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Array.html#-dupEach)

Categories: Copying
