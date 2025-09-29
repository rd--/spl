# sum

- _sum(c)_
- _sum(c, f:/1)_

Answer the sum of all the elements in the collection _c_.

```
>>> [1 2 3 5 7 9].sum
27

>>> [1.pi 1 4 1.e 7 8].sum
25.8599

>>> (1:10 ^ 2).sum
385
```

At `Span` and `Range`,
the `sum` is calculated directly using a closed form:

```
>>> 1:9.sum
45

>>> 9 * (9 + 1) / 2
45

>>> 1:9.reduce(+)
45

>>> (3, 5 .. 27).sum
195

>>> let k = 27 - 3 / 2 + 1;
>>> k * ((k - 1) * 2 + (3 * 2)) / 2
195

>>> (2 .. 1000).sum
500499

>>> (23L, 37L .. 26781361428314L).sum
25615761426939509660643648L

>>> (1, 1.01 .. 5).sum
1198
```

Row-wise sums of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9]
>>> .collect(sum:/1)
[6 15 24]

>>> [1 2 3; 4 5 6; 7 8 9]
>>> .transpose
>>> .sum
[6 15 24]
```

Column-wise sums of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].sum
[12 15 18]

>>> [1 2 3; 4 5 6; 7 8 9]
>>> .transpose
>>> .collect(sum:/1)
[12 15 18]
```

Total sum of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].sum.sum
45
```

Sum is implemented efficiently for `IdentityMultiset` as a sum of products:

```
>>> [3 3 3 5 5 5 5 5].asIdentityMultiset.sum
(3 * 3) + (5 * 5)
```

The sum of an empty collection is `zero`:

```
>>> [].sum
0
```

Difference between a sum squared, and the sum of squares:

```
>>> let x = 1:100;
>>> (x.sum ^ 2) - (x ^ 2).sum
25502500 - 338350
```

The binary form applies the block _f_ to each element before summing:

```
>>> 1:10.sum(square:/1)
385
```

An instance of a family of cutoff, or weighting, functions that answer _-1/12_ for a partial sum of the integers:

```
>>> let n = 5;
>>> (1 .. 99).sum { :x |
>>> 	x * (x / n).-.exp * (x / n).cos
>>> }
-1/12
```

Evaluate symbolically:

```
>> [𝒙 𝒚 𝒛].sum
(+ (+ x y) z)
```

Where supported `sum` is displayed as Σ.

* * *

See also: +, accumulate, injectInto, neumaierSum, pairwiseSum, prefixSum, product, reduce

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Total.html),
[2](https://mathworld.wolfram.com/Sum.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/sum.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#sum)

Unicode: U+03A3 Σ Greek Capital Letter Sigma

Categories: Math, Operator
