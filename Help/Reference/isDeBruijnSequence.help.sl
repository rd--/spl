# isDeBruijnSequence

- _isDeBruijnSequence([x₁ x₂ …], k, n)_

Answer `true` if _x_ is a de Bruijn sequence on an alphabet of size _k_ of oder _n_:

```
>>> [0 0 1 1]
>>> .isDeBruijnSequence(2, 2)
true

>>> [0 0 0 1 0 1 1 1]
>>> .isDeBruijnSequence(2, 3)
true

>>> [0 0 0 0 1 0 0 1 1 0 1 0 1 1 1 1]
>>> .isDeBruijnSequence(2, 4)
true

>>> [0 0 0 0 1 1 1 1 0 1 1 0 0 1 0 1]
>>> .isDeBruijnSequence(2, 4)
true

>>> 'AAAABAABBABABBBB'
>>> .characters
>>> .isDeBruijnSequence(2, 4)
true

>>> [
>>> 	0 0 0 0 0 1 0 0 0 1
>>> 	1 0 0 1 0 1 0 0 1 1
>>> 	1 0 1 0 1 1 0 1 1 1
>>> 	1 1
>>> ].isDeBruijnSequence(2, 5)
true

>>> [0 0 1 0 2 1 1 2 2]
>>> .isDeBruijnSequence(3, 2)
true

>>> [0 0 1 0 2 0 3 1 1 2 1 3 2 2 3 3]
>>> .isDeBruijnSequence(4, 2)
true
```

* * *

See also: deBruijnSequence

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/deBruijnSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/De_Bruijn_sequence)

Categories: Math, Sequence
