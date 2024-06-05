# integerLength

- _integerLength(anInteger, radix)_

Answer the number of digits in the base _radix_ representation of _anInteger_.

Find the number of decimal digits in 123456789:

```
>>> 123456789.integerLength(10)
9

>>> 123456789.log(10).floor + 1
9
```

The number of binary digits in _100!_:

```
>>> 100.!.integerLength(2)
525
```

Find how the number of digits in _100!_ decreases with the base:

```
>>> 2:20.collect { :n |
>>> 	100.!.integerLength(n)
>>> }
[525 332 263 227 204 187 175 166 158 152 147 142 138 135 132 129 126 124 122]
```

Plot for base 10 from -25 to 25:

~~~
-25:25.functionPlot { :x | x.integerLength(10) }
~~~

Plot for base 2 from 1 to 1023:

~~~
1:1023.functionPlot { :x | x.integerLength(2) }
~~~

Plot for base 10 for factorials, minus pre-factorial value:

~~~
1:50.functionPlot { :x | x.!.integerLength(10) - x }
~~~

* * *

See also: bitLength, digitCount, integerDigits, log, log2, log10, integerExponent, numberOfDigitsInBase

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntegerLength.html)
