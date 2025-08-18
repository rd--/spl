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

Plot the sum of the digits in the first 100 positive integers:

~~~spl svg=A
1:100.collect(digitSum:/1).discretePlot
~~~

![](sw/spl/Help/Image/digitSum-A.svg)

* * *

See also: digitCount, divisorSum, integerDigits, integerExponent, integerLength, integerReverse, integerString, sum

Guides: Integer Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DigitSum.html)
