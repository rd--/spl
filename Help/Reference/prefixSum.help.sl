# prefixSum

- _prefixSum([x₁ x₂ …])_

Answer a `List` of the successive accumulated totals of elements in the sequence _x_.
This operation is also called `accumulate`, and is equivalent to _scan(x,+)_.

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

* * *

See also: +, accumulate, differences, prefixes, prefixProduct, scan, sum

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CumulativeSum.html),
_Python_
[1](https://numpy.org/doc/2.1/reference/generated/numpy.cumsum.html),
_R_
[1](https://stat.ethz.ch/R-manual/R-devel/library/base/html/cumsum.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-integrate),
_W_
[1](https://en.wikipedia.org/wiki/Prefix_sum)
