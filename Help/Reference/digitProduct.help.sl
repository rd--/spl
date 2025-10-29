# digitProduct

- _digitProduct(n, b=10)_

Answer the product of the base _b_ digits in the integer _n_.

Find the product of the decimal digits in 58127:

```
>>> 58127.digitProduct
560

>>> 58127.integerDigits.product
560
```

Use a base larger than ten:

```
>>> 58129.digitProduct(16)
42

>>> 58129.integerDigits(16).product
42
```

Plot the product of the digits in the first 100 positive integers:

~~~spl svg=A
1:100.collect(digitProduct:/1).discretePlot
~~~

![](sw/spl/Help/Image/digitProduct-A.svg)

* * *

See also: digitCount, digitSum, integerDigits, product

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DigitProduct.html)
