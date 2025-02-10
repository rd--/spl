# map

- _map(α)_ ⇒ _each(α)_
- _map(α, β)_ ⇒ _collect(β, α)_
- _map(α, β, γ)_ ⇒ _withCollect(γ, α, β)_
- _map(α, β, γ, δ)_ ⇒ _withWithCollect(δ, α, β, γ)_

The unary form answers a `Block` that will apply _aBlock_ element wise to two sequences.
If the sequences are not of equal size the shorter will be cycled.
This form is equivalent to `each`.

```
>>> ['i' 'j' 'k'] ++.map ['w' 'x' 'y' 'z']
['iw' 'jx' 'ky' 'iz']

>>> ['i' 'j' 'k'].withCollect(
>>> 	['w' 'x' 'y' 'z'],
>>> 	++
>>> )
['iw' 'jx' 'ky' 'iz']

>>> ['i' 'j' 'k'] ++.each ['w' 'x' 'y' 'z']
['iw' 'jx' 'ky' 'iz']
```

The binary form is a variant of `collect`:

```
>>> { :x |
>>> 	x * x
>>> }.map([3 5 7])
[9 25 49]

>>> [3 5 7].collect { :x |
>>> 	x * x
>>> }
[9 25 49]
```

The ternary form is a variant of `withCollect`:

```
>>> { :p :q |
>>> 	p * 2 + q
>>> }.map(9:-1:1, 1:9)
[19 .. 11]

>>> 9:-1:1.withCollect(
>>> 	1:9
>>> ) { :p :q |
>>> 	p * 2 + q
>>> }
[19 .. 11]

>>> *.map([1 3 5], [3 5 7])
[3 15 35]

>>> [1 3 5].withCollect([3 5 7], *)
[3 15 35]
```

The quaternary form is a variant of `withWithCollect`:

```
>>> { :p :q :r |
>>> 	p * q ^ r
>>> }.map(1:7, 9:-1:3, 5:-1:-1)
[59049 65536 9261 576 25 1 0.04762]

>>> 1:7.withWithCollect(
>>> 	9:-1:3,
>>> 	5:-1:-1
>>> ) { :p :q :r |
>>> 	p * q ^ r
>>> }
[59049 65536 9261 576 25 1 0.04762]
```

* * *

See also: collect, each, swap, table, withCollect, withWithCollect

References:
_Python_
[1](https://docs.python.org/3/library/functions.html#map)

Categories: Enumerating
