# sum

- _sum(aCollection)_

Answer the sum of all the elements in _aCollection_.

```
>>> [1 2 3 5 7 9].sum
27

>>> [pi 1 4 e 7 8].sum
25.8599
```

At `Range`:

```
>>> 1:9.sum
45

>>> 1:9.reduce(+)
45
```

Sums of matrices:

```
>>> [1 2 3; 4 5 6; 7 8 9].collect(sum:/1)
[6 15 24]

>>> [1 2 3; 4 5 6; 7 8 9].transposed.collect(sum:/1)
[12 15 18]

>>> [1 2 3; 4 5 6; 7 8 9].sum
[12 15 18]

>>> [1 2 3; 4 5 6; 7 8 9].sum.sum
45
```

Sum is implemented efficiently for `Bag` as a sum of products:

```
>>> [3 3 3 5 5 5 5 5].asBag.sum
(3 * 3) + (5 * 5)
```

Where supported `sum` is displayed as Σ.

* * *

See also: +, product, reduce

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Total.html)

Unicode: U+03A3 Σ Greek Capital Letter Sigma

Categories: Math, Operator
