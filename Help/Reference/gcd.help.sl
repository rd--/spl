# gcd

- _gcd(aCollection)_
- _gcd(aNumber, anotherNumber)_

Greatest common divisor.

```
>>> 0.gcd(9)
9

>>> 4.gcd(6)
2

>>> 0.gcd(1)
1

>>> 1024.gcd(256)
256

>>> 1024.gcd(-256)
256

>>> 66.gcd(54) * 66.lcm(54)
66 * 54

>>> [2 6 10].reduce(gcd:/2)
2

>>> [2 6 10].gcd
2

>>> [-12 9 57].gcd
3

>>> [1/3 2/5 3/7].gcd
1/105
```

The one-argument form is identity for positive integers & an error for empty collections:

```
>>> [5].gcd
5

>>> { [].gcd }.ifError { true }
true
```

Gcd threads elementwise over lists:

```
>>> [3 7 40].collect { :each |
>>> 	12.gcd(each)
>>> }
[3 1 4]

>>> [3 7 40].gcd(12)
[3 1 4]

>>> 12.gcd([3 7 40])
[3 1 4]
```

Compute for large integers:

```
>>> [20L.factorial, 10L ^ 100 + 3].gcd
7L
```

In a divisibility network, two numbers are connected if they share a common divisor:

```
>>> 1:9.tuples(2).select { :each |
>>> 	let [i, j] = each;
>>> 	i < j & {
>>> 		i.gcd(j) > 1
>>> 	}
>>> }
[2 4; 2 6; 2 8; 3 6; 3 9; 4 6; 4 8; 6 8; 6 9]
```

For `zero` and `one`, `gcd` is analogous to logical or:

```
>>> gcd:/2.table([0 1], [0 1])
[0 1; 1 1]

>>> ||.table([false true], [false true])
[false true; true true]
```

Plot the gcd for a number with 12:

~~~spl svg=A
1:72.functionPlot { :x | x.gcd(12) }
~~~

![](sw/spl/Help/Image/gcd-A.svg)

* * *

See also: ||, euclideanAlgorithm, extendedGcd, Gcd, lcm

References:
_Apl_
[1](https://aplwiki.com/wiki/GCD),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:gcd),
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/GCD.html),
_Smalltalk_
5.6.5.12

Categories: Arithmetic
