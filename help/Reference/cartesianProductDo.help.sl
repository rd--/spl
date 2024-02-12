# cartesianProductDo

- _cartesianProductDo(aCollection, anotherCollection, aBlock:/2)_

Apply _aBlock_ to each two-tuple in the cartesian product of _aCollection_ and _anotherCollection_.

The Cartesian product of two sets A and B is the set of all (a, b) where a ∈ A and b ∈ B.

_cartesianProductDo(α, β, γ)_ is distinct from _tuplesDo([α, β], γ)_ only in the arity of γ.

* * *

See also: cartesianProduct, tuplesDo

Categories: Enumerating
