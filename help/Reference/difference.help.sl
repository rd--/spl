# difference

- _difference(aCollection, anotherCollection)_

Answer a value like _aCollection_ that is the set theoretic difference of the two collections.
This is also called the _relative complement_.

```
>>> 1:4.difference(2:5)
[1]
```

The operator form is `\`:

```
>>> 1:4 \ 2:5
[1]
```

`difference` is not symmetrical:

>>> [1 2 3] \ [2 3 4]
[1]

>>> [2 3 4] \ [1 2 3]
[4]
```

Find which elements in the first list are not in any of the subsequent lists:

```
>>> ['a' 'b' 'c' 'd' 'e'] \ ['a' 'c'] \ ['d']
['b' 'e']
```

Find divisors of 20 that are not also divisors of 12:

```
>>> 20.divisors \ 12.divisors
[5 10 20]
```

Find which triples of digits do not occur in the binary decomposition of 12345:

```
>>> [0 1].tuples(3) \ 12345.integerDigits(2).partition(3, 1)
[0 1 0; 1 0 1]
```

The answer is not sorted and may contain repeated elements:

```
>>> 'bedabcd'.contents \ 'bc'.contents
'edad'.contents
```

* * *

See also: intersection, symmetricDifference, union

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:-92--92-),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Complement.html)

Categories: Set, Logic
