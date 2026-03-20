# predicateAnd

- _predicateAnd(p₁, p₂)_
- _predicateAnd([p₁ p₂ …])_

Answer a predicate that answers `true` if both of the predicates _p₁_ and _p₂_ answer `true`,
else `false`.

```
>>> -23:23.select(
>>> 	isPositive:/1.predicateAnd(
>>> 		isOdd:/1
>>> 	)
>>> )
[1 3 5 7 9 11 13 15 17 19 21 23]
```

The unary form answers a predicate that answers `true` if all of the predicates _p_ answer `true`,
else `false`.

```
>>> -23:23.select(
>>> 	[
>>> 		isNegative:/1,
>>> 		isOdd:/1,
>>> 		congruencePredicate(0, 3)
>>> 	].predicateAnd
>>> )
[-21 -15 -9 -3]
```

* * *

See also: allSatisfy, allTrue, predicateNot, predicateOr

Guides: Boolean Functions
