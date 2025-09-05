# intersection

- _intersection(c₁, c₂)_
- _intersection([c₁ c₂ …])_

Answer the set theoretic intersection of two collections,
or of each of the subcollection _c_.

At `Set`:

```
>>> let s1 = [1 1 2 3].Set;
>>> let s2 = [3 1 4].Set;
>>> let s3 = [4 1 3 3].Set;
>>> s1.intersection(s2).intersection(s3)
[1 3].Set
```

At `List`,
find divisors common to 45 and 78:

```
>>> 45.divisors.intersection(78.divisors)
[1 3]

>>> [45 78].divisors.intersection
[1 3]
```

The unary form answers the items that are present in all subcollections:

```
>>> [1 2 3; 2 3 4; 3 4 5].intersection
[3]

>>> [1 2; 2 3; 3 4].intersection
[]

>>> [].intersection
[]
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

Guides: Set Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Intersection),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Intersection.html)
[2](https://reference.wolfram.com/language/ref/IntervalIntersection.html),
_W_
[1](https://en.wikipedia.org/wiki/Intersection_(set_theory))

Unicode: U+2229 ∩ Intersection

Categories: Enumerating
