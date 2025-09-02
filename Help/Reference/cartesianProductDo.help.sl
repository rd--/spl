# cartesianProductDo

- _cartesianProductDo(c₁, c₂, f:/2)_

Apply the block _f_ to each two-tuple in the cartesian product of the collections c₁ and c₂.

The Cartesian product of two sets A and B is the set of all (a, b) where a ∈ A and b ∈ B.

```
>>> let r = [];
>>> [1 2 3].cartesianProductDo(
>>> 	[4 5 6]
>>> ) { :i :j |
>>> 	r.add([i j])
>>> };
>>> r
[1 4; 1 5; 1 6; 2 4; 2 5; 2 6; 3 4; 3 5; 3 6]
```

_Rationale:_
`cartesianProductDo` is distinct from `tuplesDo` of a two-item list only in the arity of _f_.

* * *

See also: cartesianProduct, tuplesDo

Guides: Iteration Functions

Categories: Enumerating
