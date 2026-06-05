# average

- _average(c)_

An alias for `mean`.

```
>>> [1 3 5 7 9].average
5
```

Sets of twelve primes whose pairwise averages are all distinct primes,
with smallest largest element (Granville 2008):

```
>>> [
>>> 	71 1163 1283 2663 4523
>>> 	5651 9311 13883 13931 14423
>>> 	25943 27611
>>> ].partition(2. 1)
>>> .collect(average:/1)
[
	617 1223 1973 3593 5087
	7481 11597 13907 14177 20183
	26777
]

>>> [
>>> 	617 1223 1973 3593 5087
>>> 	7481 11597 13907 14177 20183
>>> 	26777
>>> ].isPrime.allTrue
true
```

* * *

See also: mean
