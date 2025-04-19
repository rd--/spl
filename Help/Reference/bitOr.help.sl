# bitOr

- _bitOr(aCollection)_
- _bitOr(aNumber, anotherNumber)_

Answers the bitwise or of the integers _aNumber_ and _anotherNumber_.

```
>>> 61.bitOr(15)
63

>>> [61 15 63].integerDigits(2, 6)
[1 1 1 1 0 1; 0 0 1 1 1 1; 1 1 1 1 1 1]
```

At `LargeInteger`:

```
>>> (3L ^ 40).bitOr(5L ^ 40)
9094947020656640004005559649L
```

Use negative numbers:

```
>>> -2.bitOr(-3)
-1
```

The unary form reduces over a collection:

```
>>> [3333 5555 7777 9999].bitOr
16383
```

Truth table for or:

```
>>> bitOr:/2.outer([1 0], [1 0])
[1 1; 1 0]

>>> [0 1; 0 1].bitOr([0 0; 1 1])
[0 1; 1 1]
```

Plot a nested pattern:

~~~spl svg=A
1:100.bitOr(0:99).linePlot
~~~

![](sw/spl/Help/Image/bitOr-A.svg)

Plot `bitOr` with double:

~~~spl svg=B
1:63.bitOr(2 * 1:64).linePlot
~~~

![](sw/spl/Help/Image/bitOr-B.svg)

Plot bitOr with double and triple:

~~~spl svg=C
1:64.functionPlot { :i |
	[i, i * 2, i * 3].bitOr
}
~~~

![](sw/spl/Help/Image/bitOr-C.svg)

* * *

See also: and, bitNot, bitOr, bitXor

Guides: Bitwise Functions, Logical Operators

References:
_Mathematica_
[1](https://mathworld.wolfram.com/OR.html)
[2](https://reference.wolfram.com/language/ref/BitOr.html),
_Smalltalk_
5.6.5.7

Categories: Logic
