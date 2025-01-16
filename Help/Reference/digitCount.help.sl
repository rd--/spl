# digitCount

- _digitCount(n, b, d)_

Answer the number of _d_ digits in the base-_b_ representation of _n_.

Binary representation:

```
>>> 2147.integerDigits(2)
[1 0 0 0 0 1 1 0 0 0 1 1]
```

Number of 1s in binary representation:

```
>>> 2147.digitCount(2, 1)
5
```

Number of 1s and 0s:

```
>>> 2147.digitCount(2)
[5 7]
```

Count the number of digits 1 and 2 in ternary representation:

```
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

Plot the number of 1s in the base-2 representation:

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

* * *

See also: bitAnd, hammingDistance, integerDigits, integerExponent, integerLength, thueMorse

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DigitCount),
_OEIS_
[1](https://oeis.org/A006046)

Categories: Querying
