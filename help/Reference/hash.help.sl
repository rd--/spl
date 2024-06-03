# hash

- _hash(aString)_

Answer an integer hash code for _aString_.

```
>>> 'abcdef'.hash
572554180
```

Similar strings answer disimilar hashes:

```
>>> 'abcdee'.hash
2814836336
```

Hashes of the first six letters of the alphabet:

```
>>> 'abcdef'.contents.collect(hash:/1)
[3663734039 795374640 671592221 2541462361 2157972536 3052205057]
```

* * *

See also: String

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HashFunction.html)
[2](https://reference.wolfram.com/language/ref/Hash.html)
