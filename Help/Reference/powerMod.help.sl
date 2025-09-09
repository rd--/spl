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

>>> 4030.powerMod(2657, 55049)
21144

>>> 21144.powerMod(79081, 55049)
4030
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
>>> 		let z = b.powerMod(n - 1, n);
>>> 		z = 1 & {
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

At large integers:

```
>>> let a = [
>>> 	2 9 8 8 3 4 8 1 6 2
>>> 	0 5 8 5 7 4 1 3 6 9
>>> 	1 5 8 9 1 4 2 1 4 9
>>> 	8 8 1 9 4 6 6 3 2 0
>>> 	1 6 3 3 1 2 9 2 6 9
>>> 	5 2 4 2 3 7 9 1 0 2
>>> 	3 0 7 8 8 7 6 1 3 9
>>> ].fromDigits(10L);
>>> let b = [
>>> 	2 3 5 1 3 9 9 3 0 3
>>> 	3 7 3 4 6 4 4 8 6 4
>>> 	6 6 1 2 2 5 4 4 5 2
>>> 	3 6 9 0 0 9 4 7 4 4
>>> 	9 7 5 2 3 3 4 1 5 5
>>> 	4 4 0 7 2 9 9 2 6 5
>>> 	6 8 8 1 2 4 0 3 1 9
>>> ].fromDigits(10L);
>>> let m = 10L ^ 40;
>>> powerMod(a, b, m)
[
	1 5 2 7 2 2 9 9 9 8
	5 8 5 2 4 8 4 5 0 0
	1 6 8 0 8 9 5 8 3 4
	3 7 4 0 4 5 3 0 5 9
].fromDigits(10L)
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
