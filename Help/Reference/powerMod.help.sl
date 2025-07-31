# powerMod

- _powerMod(a, b, m)_

Answers _(a ^ b) % m_.

```
>>> 2.powerMod(10, 3)
1

>>> 3.powerMod(2, 7)
2

>>> 3.powerMod(5, 7)
5

>>> 5.powerMod(3, 13)
8

>>> 4.powerMod(13, 497)
445
```

If _b_ is negative answer the multiplicative modular inverse of _a^|b|_ and _m_:

```
>>> 38.powerMod(-1, 97)
23

>>> (23 * 38) % 97
1

>>> 3.powerMod(-2, 7)
4

>>> 9.modularInverse(7)
4

>>> 2.powerMod(-1, 5)
3
```

Threads over first argument:

```
>>> 1:4.powerMod(4, 5)
[1 1 1 1]

>>> 10:14.collect { :b |
>>> 	2.powerMod(b, 5)
>>> }
[4 3 1 2 4]
```

Use `powerMod` to generate all coprime integers modulo 9:

```
>>> 2:10.collect { :each |
>>> 	2.powerMod(each, 9)
>>> }.asIdentitySet.sorted
[1 2 4 5 7 8]
```

Find all base two and five pseudoprimes below one thousand:

```
>>> [2 5].collect { :b |
>>> 	2:1000.select { :n |
>>> 		b.powerMod(n - 1, n) = 1 & {
>>> 			n.isComposite
>>> 		}
>>> 	}
>>> }
[
	341 561 645;
	4 124 217 561 781
]
```

The results have the same sign as the modulus:

```
>>> [5 -5].powerMod(2, 3)
[1 1]

>>> [5 -5].powerMod(2, -3)
[-2 -2]
```

Plot the sequence with fixed powers:

~~~spl svg=A
1:50.functionPlot { :x |
	x.powerMod(2, 11)
}
~~~

![](sw/spl/Help/Image/powerMod-A.svg)

Plot the sequence with varying powers:

~~~spl svg=B
1:50.functionPlot { :x |
	2.powerMod(x, 11)
}
~~~

![](sw/spl/Help/Image/powerMod-B.svg)

Plot a list of powers of 3 where the exponent is varied, modulo some prime number:

~~~spl svg=C
let n = 44.prime;
(1 .. n - 1).functionPlot { :x |
	3.powerMod(x, n)
}
~~~

![](sw/spl/Help/Image/powerMod-C.svg)

* * *

See also: ^, %

Guides: Integer Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PowerMod.html)
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.powermod.html),
_W_
[1](https://en.wikipedia.org/wiki/Modular_exponentiation)
