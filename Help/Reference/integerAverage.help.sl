# integerAverage

- _integerAverage(c)_

Answer a `Fraction` that is the average value of the integers in the collection _c_.

```
>>> [1 2 3 7 9].integerAverage
22/5
```

Compare to `average`:

```
>>> [1 2 3 7 9].average
4.4

>>> [1L 2 3 7 9].average
22/5
```

It is an error if the sum of _c_ is not an integer:

```
>>> {
>>> 	[1.2 4.5].integerAverage
>>> }.hasError
true
```

* * *

See also: average, mean, size, sum
