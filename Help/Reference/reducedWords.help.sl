# reducedWords

- _reducedWords(aPermutation)_

Answer the reduced words of _aPermutation_.
A reduced word is a minimal way of arriving at a permutation by repeatedly interchanging adjacent entries.

There are two reduced words for _2143_:

```
>>> Permutation[2 1 4 3]
>>> .reducedWords
[3 1; 1 3]
```

_321_ has two also:

```
>>> Permutation[3 2 1]
>>> .reducedWords
[1 2 1; 2 1 2]
```

_3241_ has three, of which _1213_ and _2123_ differ by a braid, and _1231_ and _1213_ by a commutation:

```
>>> Permutation[3 2 4 1]
>>> .reducedWords
[1 2 3 1; 1 2 1 3; 2 1 2 3]
```

_213_ and _312_ each have one:

```
>>> Permutation[2 1 3]
>>> .reducedWords
[[1]]

>>> Permutation[3 1 2]
>>> .reducedWords
[[2 1]]
```

_4356435_ is a reduced word of _1265734_:

```
>>> let p = Permutation[1 2 6 5 7 3 4];
>>> let r = p.reducedWords;
>>> r.includes([4 3 5 6 4 3 5])
true
```

The number of reduced words can be calculated directly:

```
>>> Permutation[4 3 2 1]
>>> .reducedWords.size
16

>>> Permutation[5 4 3 2 1]
>>> .reducedWords.size
768

>>> 5.binomial(2).!
>>> /
>>> ((1 ^ 4) * (3 ^ 3) * (5 ^ 2) * (7 ^ 1))
768
```

* * *

See also: Permutation

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/permutation.html#sage.combinat.permutation.Permutation.reduced_words)

Further Reading: Tenner 2017
