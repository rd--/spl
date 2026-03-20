# predicateOr

- _predicateOr(p₁, p₂)_
- _predicateOr([p₁ p₂ …])_

Answer a predicate that answers `true` if either of the predicates _p₁_ or _p₂_ answer `true`,
else `false`.

```
>>> -7:7.select(
>>> 	isPositive:/1.predicateOr(
>>> 		isOdd:/1
>>> 	)
>>> )
[-7 -5 -3 -1 1 2 3 4 5 6 7]
```

The unary form answers a predicate that answers `true` if any of the predicates _p_ answer `true`,
else `false`.

```
>>> -6:6.select(
>>> 	[
>>> 		isNegative:/1,
>>> 		isOdd:/1,
>>> 		congruencePredicate(0, 3)
>>> 	].predicateOr
>>> )
[-6 -5 -4 -3 -2 -1 0 1 3 5 6]
```

* * *

See also: anySatisfy, anyTrue, predicateAnd, predicateNot

Guides: Boolean Functions
