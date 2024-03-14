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

The answer is not sorted and may contain repeated elements:

```
'bedabcd'.contents \ 'bc'.contents
'edad'.contents
```

* * *

See also: intersection, union

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Data-List.html#v:-92--92-)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Complement.html)

Categories: Set, Logic
