# isYamanouchiWord

- _isYamanouchiWord([x₁ x₂ …])_

Answer `true` if the sequence _x_ is a right Yamanouchi word, else `false`.

A _3,2_ Yamanouchi word:

```
>>> [1 2 2 1 1]
>>> .isYamanouchiWord
true
```

A _4,3,2,1_ Yamanouchi word:

```
>>> [2 3 4 3 1 2 1 1 2 1].asMultiset
>>> .isYamanouchiWord
true
```

A left Yamanouchi word is called a lattice word,
a _5,3_ Yamanouchi word:

```
>>> let a = [1 1 1 2 2 1 2 1];
>>> let b = a.reverse;
>>> (
>>> 	a.isLatticeWord,
>>> 	b.isYamanouchiWord
>>> )
(true, true)
```

There are five _2,2,1_ Yamanouchi words:

```
>>> [
>>> 	3 2 2 1 1;
>>> 	2 3 2 1 1;
>>> 	3 2 1 2 1;
>>> 	2 3 1 2 1;
>>> 	2 1 3 2 1
>>> ].allSatisfy(isYamanouchiWord:/1)
```

* * *

See also: isLatticeWord

Guides: Combinatorial Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Yamanouchi_word)
