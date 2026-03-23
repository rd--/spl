# inverseBinomialTransform

- _inverseBinomialTransform(f:/1)_
- _inverseBinomialTransform([x₁ x₂ …])_

Answer the inverse binomial transform of the unary function _f_ or the integer sequence _x_.

Inverse binomial transform of _(3^n+1)/2_,
OEIS [A011782](https://oeis.org/A011782):

```
>>> ((3 ^ 0:11) + 1 / 2)
>>> .inverseBinomialTransform
[1 1 2 4 8 16 32 64 128 256 512 1024]
```

The inverse binomial transform of the Fibonacci numbers is the signed Fibonacci numbers,
OEIS [A039834](https://oeis.org/A039834):

```
>>> 1:13.fibonacci
>>> .inverseBinomialTransform
[1 0 1 -1 2 -3 5 -8 13 -21 34 -55 89]
```

The inverse binomial transform of powers of three,
OEIS [A000079](https://oeis.org/A000079):

```
>>> (3 ^ 0:12)
>>> .inverseBinomialTransform
2 ^ 0:12
```

The inverse binomial transform of powers of two,
OEIS [A000012](https://oeis.org/A000012):

```
>>> (2 ^ 0:12)
>>> .inverseBinomialTransform
[1 1 1 1 1 1 1 1 1 1 1 1 1]

>>> 1 ^ 0:12
[1 1 1 1 1 1 1 1 1 1 1 1 1]
```

The inverse binomial transform of
OEIS [A001792](https://oeis.org/A001792)
is
OEIS [A000027](https://oeis.org/A000027):

```
>>> let n = 0:12;
>>> let a = (n + 2) * (2 ^ (n - 1));
>>> a.inverseBinomialTransform
[1 2 3 4 5 6 7 8 9 10 11 12 13]
```

The inverse binomial transform of all ones,
OEIS [A000007](https://oeis.org/A000007):

```
>>> [1 1 1 1 1 1 1 1 1 1 1 1 1]
>>> .inverseBinomialTransform
[1 0 0 0 0 0 0 0 0 0 0 0 0]
```

The inverse binomial transform of the Lucas numbers,
OEIS [A000032](https://oeis.org/A000032),
is
OEIS [A061084](https://oeis.org/A061084):

```
>>> 11.lucasSequence
>>> .inverseBinomialTransform
[2 -1 3 -4 7 -11 18 -29 47 -76 123]

>>> (1 - 1:11).lucasL.round
[2 -1 3 -4 7 -11 18 -29 47 -76 123]
```

Powers of two alternating with zeros,
the inverse binomial transform of the Pell-Lucas numbers,
OEIS [A077957](https://oeis.org/A077957):

```
>>> linearRecurrence([2 1], [1 1], 16)
>>> .inverseBinomialTransform
[1 0 2 0 4 0 8 0 16 0 32 0 64 0 128 0]
```

The signed Fibonacci numbers,
OEIS [A039834](https://oeis.org/A039834):

~~~spl svg=A oeis=A039834
1:65.fibonacci
.inverseBinomialTransform
.discretePlot.logScale
~~~

![](Help/Image/inverseBinomialTransform-A.svg)

The inverse binomial transform of the prime numbers,
OEIS [A007442](https://oeis.org/A007442):

~~~spl svg=B oeis=A007442
1:65.prime
.inverseBinomialTransform
.discretePlot.logScale
~~~

![](Help/Image/inverseBinomialTransform-B.svg)

The inverse binomial transform of the rabbit sequence,
OEIS [A124841](https://oeis.org/A124841):

~~~spl svg=C oeis=A124841
(1 - 1:65.fibonacciWord)
.inverseBinomialTransform
.discretePlot.logScale
~~~

![](Help/Image/inverseBinomialTransform-C.svg)

The inverse binomial transform of the Lucas numbers,
OEIS [A061084](https://oeis.org/A061084):

~~~spl svg=D oeis=A061084
65.lucasSequence
.inverseBinomialTransform
.discretePlot.logScale
~~~

![](Help/Image/inverseBinomialTransform-D.svg)

* * *

See also: binomialTransform

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BinomialTransform.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_transform)
