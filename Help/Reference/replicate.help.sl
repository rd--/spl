# replicate

- _replicate([n₁ n₂ …], [x₁ x₂ …])_

Replicate each element of the sequence _x_ the number of times indicated by _n_,
which must have the same number of places as _x_.

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

See also: !, #, duplicate, List

Guides: List Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Replicate),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number#dyadic)

Categories: Copying
