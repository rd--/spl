# digitSum

- _digitSum(n, b=10)_

Answer the sum of the base _b_ digits in the integer _n_.

Find the sum of the decimal digits in 58127:

```
>>> 58127.digitSum
23

>>> 58127.integerDigits.sum
23
```

Find the sum of the binary digits in 58127:

```
>>> 58127.digitSum(2)
9

>>> 58127.integerDigits(2).sum
9
```

Use a base larger than ten:

```
>>> 58127.digitSum(16)
32

>>> 58127.integerDigits(16).sum
32
```

First few terms for _b_ in _(2,10)_:

```
>>> 2:10.collect { :b |
>>> 	1:18.collect { :n |
>>> 		n.digitSum(b)
>>> 	}
>>> }
[
	1 1 2 1 2 2 3 1 2 2 3 2 3 3 4 1 2 2;
	1 2 1 2 3 2 3 4 1 2 3 2 3 4 3 4 5 2;
	1 2 3 1 2 3 4 2 3 4 5 3 4 5 6 1 2 3;
	1 2 3 4 1 2 3 4 5 2 3 4 5 6 3 4 5 6;
	1 2 3 4 5 1 2 3 4 5 6 2 3 4 5 6 7 3;
	1 2 3 4 5 6 1 2 3 4 5 6 7 2 3 4 5 6;
	1 2 3 4 5 6 7 1 2 3 4 5 6 7 8 2 3 4;
	1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8 9 2;
	1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9
]
```

Plot the sum of the digits in the first 100 positive integers,
where _b=10_,
OEIS [A007953](http://oeis.org/A007953):

~~~spl svg=A
1:100.collect(digitSum:/1).discretePlot
~~~

![](sw/spl/Help/Image/digitSum-A.svg)

Scatter plot of first few terms where _b=2_,
OEIS [A000120](http://oeis.org/A000120):

~~~spl svg=B
1:250.collect { :n |
	n.digitSum(2)
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitSum-B.svg)

* * *

See also: digitCount, digitProduct, divisorSum, integerDigits, integerExponent, integerLength, integerReverse, integerString, sum

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DigitSum.html)
[2](https://reference.wolfram.com/language/ref/DigitSum.html),
_OEIS_
[1](http://oeis.org/A000120)
[2](http://oeis.org/A053735)
[3](http://oeis.org/A053737)
[4](http://oeis.org/A053824)
[5](http://oeis.org/A053827)
[6](http://oeis.org/A053828)
[7](http://oeis.org/A053829)
[8](http://oeis.org/A053830)
[9](http://oeis.org/A007953),
_W_
[1](https://en.wikipedia.org/wiki/Digit_sum)
