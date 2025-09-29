# isLatticeWord

- _isLatticeWord([x₁ x₂ …])_

Answer `true` if the sequence _x_ is a left lattice word, else `false`.

```
>>> [1 1 1 2 2 1 2 1]
>>> .isLatticeWord
true

>>> [1 1 1 2 2 1 2 1]
>>> .reverse
>>> .isLatticeWord
false
```

A right lattice word is called a Yamanouchi word:

```
>>> let a = [1 1 1 2 2 1 2 1];
>>> let b = a.reverse;
>>> (
>>> 	a.isLatticeWord,
>>> 	b.isYamanouchiWord
>>> )
(true, true)
```

* * *

See also: isYamanouchiWord

Guides: Combinatorial Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lattice_word)
