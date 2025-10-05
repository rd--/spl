# digitCount

- _digitCount(n, b=10, d)_

Answer the number of _d_ digits in the base-_b_ representation of the integer _n_.

Consider the binary representation of a number:

```
>>> 2147.integerDigits(2)
[1 0 0 0 0 1 1 0 0 0 1 1]
```

Count the number of `one`s in the binary representation:

```
>>> 2147.digitCount(2, 1)
5
```

Count the number of `one`s and `zero`es:

```
>>> 2147.digitCount(2)
[5 7]
```

Count the number of digits _(2,1,0)_ in the ternary representation:

```
>>> 242442422.integerDigits(3)
[1 2 1 2 2 0 0 1 2 1 0 0 1 1 0 2 2 2]

>>> 242442422.digitCount(3)
[7 6 5]
```

Thue–Morse sequence:

```
>>> 1:25.collect { :n |
>>> 	1 - (n - 1).digitCount(2, 1) % 2
>>> }
[
	1 0 0 1 0 1 1 0 0 1
	1 0 1 0 0 1 0 1 1 0
	1 0 0 1 1
]
```

Plot the number of 1s in the base-2 representation,
called the Hamming weight or binary weight,
OEIS [A000120](https://oeis.org/A000120):

~~~spl svg=A
1:63.functionPlot { :each |
	each.digitCount(2, 1)
}
~~~

![](sw/spl/Help/Image/digitCount-A.svg)

Plot the number of odd elements in the first _n_ rows of Pascal’s triangle,
OEIS [A006046](https://oeis.org/A006046):

~~~spl svg=B
let b = { :k | k.digitCount(2, 1) };
1:100.functionPlot { :n |
	(0 .. n - 1).collect { :k |
		2 ^ b(k)
	}.sum
}
~~~

![](sw/spl/Help/Image/digitCount-B.svg)

Plot the first few Cantor numbers,
OEIS [A005823](https://oeis.org/A005823):

~~~spl svg=C
0:3000.select { :n |
	n.digitCount(3, 1) = 0
}.scatterPlot
~~~

![](sw/spl/Help/Image/digitCount-C.svg)

* * *

See also: bitAnd, hammingDistance, integerDigits, integerExponent, integerLength, thueMorse

Guides: Bitwise Functions, Integer Functions,Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DigitCount.html)
[2](https://reference.wolfram.com/language/ref/DigitCount),
_OEIS_
[1](https://oeis.org/A000120)
[2](https://oeis.org/A006046)
[3](https://oeis.org/A005823)

Categories: Querying
