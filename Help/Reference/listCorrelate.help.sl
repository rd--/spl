# listCorrelate

- _listCorrelate(u, v)_

Answer the correlation of the kernel _u_ with the list _v_.

+List{
	listCorrelate { :u :v |
		listConvolve(u.reverse, v)
	}
}

At `Symbol`:

```
>> [`x` `y`].listCorrelate([`a` `b` `c`])
[(+ (* b y) (* a x)), (+ (* c y) (* b x))]
```

At `Fraction`:

```
>>> let u = 1:10.square.differences;
>>> let v = Fraction(1, 1:20);
>>> u.listCorrelate(v)
[

	52489/2520 40499/2520
	124189/9240 64591/5544
	531397/51480 371809/40040
	55361/6552 86017/11088
	5860303/816816 962251/144144
	76494941/12252240 5910403/1007760
]
```

At `SmallFloat`:

```
>>> let u = 1:10.square.differences;
>>> let v = 1 / 1:20;
>>> u.listCorrelate(v)
[
	20.829 16.071 13.440 11.651 10.322
	 9.286  8.449  7.758  7.175  6.676
	 6.243  5.865
]
```

_(3*n-1)*2^(n-2)_,
OEIS [A053220](https://oeis.org/A053220):

```
>>> let n = 0:10;
>>> [1 1].listCorrelate(n * (2 ^ (n - 1)))
[1 5 16 44 112 272 640 1472 3328 7424]

>>> let n = 1:10;
>>> (3 * n - 1) * (2 ^ (n - 2))
[1 5 16 44 112 272 640 1472 3328 7424]

>>> [4 -4].linearRecurrence([1 5], 10)
[1 5 16 44 112 272 640 1472 3328 7424]
```

See also: accumulate, differences, elementaryCellularAutomaton, inner, linearRecurrence, listConvolve, movingAverage, padLeft, partition, toeplitzMatrix

Guides: Fourier Analysis Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListCorrelate.html)
