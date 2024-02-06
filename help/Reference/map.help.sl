# map

- _map(aBlock:/1, aCollection)_
- _map(aBlock:/2, aSequence, anotherSequence)_

The binary form of _map_ is _swap_ of _collect_,
i.e. _map(α, β) ⇒ collect(β, α)_.

```
>>> { :x | x * x }.map([3 5 7])
[9 25 49]

>>> collect:/2.swap . ({ :x | x * x }, [3 5 7])
[9 25 49]
```

The ternary form is _map(α, β, γ) ⇒ withCollect(γ, α, β)_.

```
>>> { :p :q | p * 2 + q }.map(9:1, 1:9)
[19 .. 11]

>>> *.map([1 3 5], [3 5 7])
[3 15 35]
```

* * *

See also: collect, withCollect

Categories: Enumerating
