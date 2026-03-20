# predicateNot

- _predicateNot(f:/1)_

Answer a predicate that answers `true` if the predicates _f_ answers `false`,
else `false`.

Select non-positive even numbers:

```
>>> -9:9.select(
>>> 	isPositive:/1.predicateOr(
>>> 		isOdd:/1
>>> 	).predicateNot
>>> )
[-8 -6 -4 -2 0]

>>> -9:9.select(
>>> 	isNonPositive:/1.predicateAnd(
>>> 		isEven:/1
>>> 	)
>>> )
[-8 -6 -4 -2 0]
```

The numbers that are not odd are the even numbers:

```
>>> 1:9.select(isOdd:/1.predicateNot)
[2 4 6 8]
```


The numbers that are not prime are the composite numbers:

```
>>> 1:9.select(isPrime:/1.predicateNot)
[1 4 6 8 9]
```

* * *

See also: anySatisfy, anyTrue, predicateAnd, predicateOr

Guides: Boolean Functions
