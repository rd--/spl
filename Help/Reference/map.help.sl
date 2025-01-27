# map

- _map(aBlock:/2)_
- _map(aBlock:/1, aCollection)_
- _map(aBlock:/2, aSequence, anotherSequence)_
- _map(aBlock:/3, aSequence, anotherSequence, aThirdSequence)_

The unary form answers a Block that will apply _aBlock_ element wise to two sequences.
If the sequences are not of equal size the shorter will be cycled.

```
>>> ['i' 'j' 'k'] ++.map ['w' 'x' 'y' 'z']
['iw' 'jx' 'ky' 'iz']

>>> ['i' 'j' 'k'].withCollect(['w' 'x' 'y' 'z'], ++)
['iw' 'jx' 'ky' 'iz']
```

The binary form of `map` is `swap` of `collect`,
i.e. _map(α, β) ⇒ collect(β, α)_.

```
>>> { :x | x * x }.map([3 5 7])
[9 25 49]

>>> collect:/2.swap . ({ :x | x * x }, [3 5 7])
[9 25 49]
```

The ternary form is _map(α, β, γ) ⇒ withCollect(γ, α, β)_.

```
>>> { :p :q | p * 2 + q }.map(9:-1:1, 1:9)
[19 .. 11]

>>> *.map([1 3 5], [3 5 7])
[3 15 35]
```

The quaternary form is _map(α, β, γ, δ) ⇒ withWithCollect(γ, α, β, δ)_.

```
>>> { :p :q :r | p * q ^ r }.map(1:7, 9:-1:3, 5:-1:-1)
[59049 65536 9261 576 25 1 0.04762]
```

* * *

See also: collect, swap, withCollect

Categories: Enumerating
