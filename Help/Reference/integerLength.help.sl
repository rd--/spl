# integerLength

- _integerLength(n, radix=10)_

Answer the number of digits in the base _radix_ representation of the integer _n_.

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
[
	525 332 263 227 204
	187 175 166 158 152
	147 142 138 135 132
	129 126 124 122
]
```

At `LargeInteger`:

```
>>> (23L ^ 23L).integerLength(10)
32

>>> (23 ^ 23).integerLength(10)
32
```

Threads over lists:

```
>>> [999 1000].integerLength(10)
[3 4]
```

At negative integers:

```
>>> [-100 -10 -1].integerLength(10)
[3 2 1]

>>> [-128 -64 -32 -16 -8 -4 -2 -1]
>>> .integerLength(2)
[8 7 6 5 4 3 2 1]
```

At `zero`:

```
>>> 0.integerLength(10)
0
```

Plot for base 10 from -25 to 25:

~~~spl svg=A
-25:25.functionPlot { :x |
	x.integerLength(10)
}
~~~

![](sw/spl/Help/Image/integerLength-A.svg)

Plot for base 2 from 1 to 1023:

~~~spl svg=B
1:1023.functionPlot { :x |
	x.integerLength(2)
}
~~~

![](sw/spl/Help/Image/integerLength-B.svg)

Plot for base 10 for factorials, minus pre-factorial value:

~~~spl svg=C
1:50.functionPlot { :x |
	x.!.integerLength(10) - x
}
~~~

![](sw/spl/Help/Image/integerLength-C.svg)

* * *

See also: bitLength, digitCount, integerDigits, log, log2, log10, integerExponent, numberOfDigitsInBase

Guides: Integer Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntegerLength.html)
