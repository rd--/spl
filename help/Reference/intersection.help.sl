# intersection

- _intersection(aCollection, anotherCollection)_

Answer the set theoretic intersection of two collections.

```
>>> [1 1 2 3].intersection([3 1 4]).intersection([4 1 3 3]).asSet
[1 3].asSet
```

Find divisors common to 45 and 78:

```
>>> 45.divisors.intersection(78.divisors)
[1 3]
```

If there is no intersection, the result is []:

```
>>> 1:5.intersection(6:9)
[]
```

Comparison is by equality:

```
>>> [1 2; 3 4; 5 6].intersection([5 6; 7 8; 9 10])
[[5, 6]]
```

* * *

See also: difference, union

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Intersection.html)

Unicode: ∩ U+2229 Intersection

Categories: Enumerating
