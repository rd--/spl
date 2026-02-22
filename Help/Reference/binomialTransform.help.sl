# binomialTransform

- _binomialTransform(f:/1)_
- _binomialTransform([x₁ x₂ …])_

Binomial transform of Fibonacci numbers,
OEIS [A001906](https://oeis.org/A001906):

```
>>> [0 1 1 2 3 5 8 13 21 34]
>>> .binomialTransform
[0 1 3 8 21 55 144 377 987 2584]

>>> 0:9.collect(
>>> 	fibonacci:/1
>>> 	.binomialTransform
>>> )
[0 1 3 8 21 55 144 377 987 2584]
```

Binomial transform of offset Fibonacci numbers,
OEIS [A001519](https://oeis.org/A001519):

```
>>> [1 1 2 3 5 8 13 21 34 55]
>>> .binomialTransform
[1 2 5 13 34 89 233 610 1597 4181]

>>> 1:10.collect(
>>> 	{ :n |
>>> 		(n - 1).fibonacci
>>> 	}.binomialTransform
>>> )
[1 2 5 13 34 89 233 610 1597 4181]
```

Binomial transform of the characteristic function of the prime numbers,
OEIS [A121497](https://oeis.org/A121497)
and [A052467](https://oeis.org/A052467):

```
>>> 0:11.collect { :n |
>>> 	n.isPrime.boole
>>> }.binomialTransform
[0 0 1 4 10 21 41 78 148 282 537 1013]

>>> 0:11.collect { :n |
>>> 	(n + 1).isPrime.boole
>>> }.binomialTransform
[0 1 3 6 11 20 37 70 134 255 476 869]
```

The characteristic function of odd numbers,
alternately _0,1_,
OEIS [A000035](https://oeis.org/A000035),
transforms to the powers of two,
OEIS [A000079](https://oeis.org/A000079):

```
>>> 0:11.collect { :n |
>>> 	n.isOdd.boole
>>> }.binomialTransform
[0 1 2 4 8 16 32 64 128 256 512 1024]
```

The Bell numbers shift one place left under the binomial transform,
OEIS [A000110](https://oeis.org/A000110):

```
>>> [1 1 2 5 15 52 203 877 4140 21147]
>>> .binomialTransform
[1 2 5 15 52 203 877 4140 21147 115975]
```

A sequence that shifts one place left under the second-order binomial transform,
OEIS [A004211](https://oeis.org/A004211):

```
>>> [1 1 3 11 49 257 1539 10299 75905]
>>> .binomialTransform
>>> .binomialTransform
[1 3 11 49 257 1539 10299 75905 609441]
```

A sequence that shifts one place left under the third-order binomial transform,
[A004212](https://oeis.org/A004212):

```
>>> [1 1 4 19 109 742 5815 51193]
>>> .binomialTransform
>>> .binomialTransform
>>> .binomialTransform
[1 4 19 109 742 5815 51193 498118]
```

Transform of _1,3,4,3,0…_,
OEIS [A006004](https://oeis.org/A006004):

```
>>> [1 3 4 3].padRight([12], 0)
>>> .binomialTransform
[1 4 11 25 49 86 139 211 305 424 571 749]

>>> linearRecurrence(
>>> 	[4 -6 4 -1],
>>> 	[1 4 11 25],
>>> 	12
>>> )
[1 4 11 25 49 86 139 211 305 424 571 749]
```

Binomial transform of Catalan numbers,
OEIS [A007317](https://oeis.org/A007317):

```
>>> 0:13.collect(catalanNumber:/1)
>>> .binomialTransform
[
	1 2 5 15 51 188 731 2950 12235 51822
	223191 974427 4302645 19181100
]
```

Binomial transform of Fine’s sequence,
OEIS [A033321](https://oeis.org/A033321):

```
>>> 13.finesSequence
>>> .binomialTransform
[
	1 1 2 6 21 79 311 1265 5275 22431
	96900 424068 1876143 8377299
]
```

* * *

See also: binomial, boustrophedonTransform, eulerTransform, runLengthTransform

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BinomialTransform.html),
_OEIS_
[1](https://oeis.org/A001906)
[2](https://oeis.org/A001519)
[3](https://oeis.org/A121497)
[4](https://oeis.org/A052467)
[5](https://oeis.org/A000079)
[6](https://oeis.org/A000110)
[7](https://oeis.org/A004211)
[8](https://oeis.org/A004212),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_transform)

Further Reading: Bernstein 1995, Donaghey 1976
