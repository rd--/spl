# duplicateEach

- _duplicateEach([x₁ x₂ …], [n₁ n₂ …])_

Repeat each item in the sequence _x_ _n_ times.

```
>>> [1 3 5].duplicateEach(2)
[1 1 3 3 5 5]

>>> [1 3 5].duplicateEach([2 3 2])
[1 1 3 3 3 5 5]
```

C.f. `replicate`:

```
>>> 2.replicate([1 3 5])
[1 1 3 3 5 5]

>>> [2 3 2].replicate([1 3 5])
[1 1 3 3 3 5 5]
```

At `Stream`:

```
>>> Sfc32(678143)
>>> .duplicateEach([2 3 2].asIterator)
>>> .next(7)
[
	0.897523 0.897523
	0.078896 0.078896 0.078896
	0.445546 0.445546
]
```

* * *

See also: replicate

Guides: List Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/List.html#-dupEach)
