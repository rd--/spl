# prefixSum

- _prefixSum(aList)_

Answer a `List` of the successive accumulated totals of elements in _aSequence_.
This operation is also called `accumulate`, and is equivalent to _scan(aSequence, +)_.

Triangular numbers:

```
>>> 1:10.prefixSum
[1 3 6 10 15 21 28 36 45 55]

>>> [1 2 3 4 5 6].prefixSum
[1 3 6 10 15 21]
```

It is also equivalent to `sum` of each of the `prefixes`:

```
>>> 1:10.prefixes.collect(sum:/1)
[1 3 6 10 15 21 28 36 45 55]
```

At matrices:

```
>>> [1 2 3; 4 5 6].prefixSum
[1 2 3; 5 7 9]
```

This is similar to the operation called _integrate_ in SuperCollider.
It is equal to the _cumsum_ function in R.

* * *

See also: +, accumulate, differences, prefixes, scan, sum

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CumulativeSum.html),
_Python_
[1](https://numpy.org/doc/2.1/reference/generated/numpy.cumsum.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-integrate),
_W_
[1](https://en.wikipedia.org/wiki/Prefix_sum)
