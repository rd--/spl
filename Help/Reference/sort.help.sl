# sort

- _sort([x₁ x₂ …], f/2)_

Answer a new `List` which contains the same elements as the collection _x_,
where the elements are sorted by the binary sort block _f_.

The block should take two arguments,
and answer `true` if the first element should preceed the second one.

The unary form of `sort` sorts using `<|`.

```
>>> [1 3 2 4 5].sort
[1 .. 5]

>>> [1 3 2 4 5].sort(>)
[5, 4 .. 1]
```

With literal block:

```
>>> [1 3 2 4 5].sort { :i :j |
>>> 	i > j
>>> }
[5, 4 .. 1]
```

Answer is a new `List`, see `sort` for in place variant:

```
>>> let a = [3 2 1];
>>> a.sort !== a
true
```

* * *

See also: ordering, sort, sortBy, sortByOn, sortOn

Guides: Sort Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sort.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#sorted)

Categories: Sorting
