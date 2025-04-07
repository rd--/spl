# intersection

- _intersection(aCollection, anotherCollection)_

Answer the set theoretic intersection of two collections.

At `Set`:

```
>>> let s1 = [1 1 2 3].asSet(=);
>>> let s2 = [3 1 4].asSet(=);
>>> let s3 = [4 1 3 3].asSet(=);
>>> s1.intersection(s2).intersection(s3)
[1 3].asSet(=)
```

At `List`,
find divisors common to 45 and 78:

```
>>> 45.divisors.intersection(78.divisors)
[1 3]
```

At `Range`,
if there is no `intersection`, the result is []:

```
>>> 1:5.intersection(6:9)
[]
```

At `List`, comparison is by equality:

```
>>> [1 2; 3 4; 5 6]
>>> .intersection(
>>> 	[5 6; 7 8; 9 10]
>>> )
[[5 6]]
```

Implemented as _left argument filtered by its existence in the right argument_, so
at `List` retains duplicates and order:

```
>>> [1 2 9 1]
>>> .intersection([3 1 9])
[1 9 1]

>>> [1 1 2 3]
>>> .intersection([3 1 4])
>>> .intersection([4 1 3 3])
[1 1 3]
```

At `Interval`:

```
>>> (-2 -- 3).intersection(1 -- 4)
(1 -- 3)
```

Where supported `intersection` is displayed as ∩.

* * *

See also: difference, lineLineIntersection, union

References:
_Apl_
[1](https://aplwiki.com/wiki/Intersection),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Intersection.html)
[2](https://reference.wolfram.com/language/ref/IntervalIntersection.html)

Unicode: U+2229 ∩ Intersection

Categories: Enumerating
