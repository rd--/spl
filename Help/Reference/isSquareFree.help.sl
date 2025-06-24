# isSquareFree

- _isSquareFree(n)_

Answer `true` if the integer _n_ is square free, else `false`.
An integer is square free if it is divisible by no perfect square other than `one`.

Test whether a number is square free:

```
>>> 10.isSquareFree
true
```

The numbers 4 and 20 are not square free:

```
>>> 4.isSquareFree
false

>>> 20.isSquareFree
false
```

The number 1 is by convention taken to be squarefree:

```
>>> 1.isSquareFree
true
```

The first few squarefree numbers are after `one`:

```
>>> 2:33.select(isSquareFree:/1)
[
	 2  3  5  6  7 10 11 13 14 15
	17 19 21 22 23 26 29 30 31 33
]
```

A number is squareful, or nonsquarefree, if it contains at least one square.
The first few squareful numbers are:

```
>>> 1:52.select { :each |
>>> 	each.isSquareFree.not
>>> }
[
	 4  8  9 12 16 18 20 24 25 27
	28 32 36 40 44 45 48 49 50 52
]
```

Plot the first few squarefree numbers:

~~~spl svg=A
1:99.select(isSquareFree:/1).linePlot
~~~

![](sw/spl/Help/Image/isSquareFree-A.svg)

Plot the first few squareful numbers:

~~~spl svg=B
1:99.select { :n |
	n.isSquareFree.not
}.linePlot
~~~

![](sw/spl/Help/Image/isSquareFree-B.svg)

* * *

See also: isPerfectSquare, isPowerfulNumber

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Squarefree.html)
[2](https://mathworld.wolfram.com/Squareful.html)
[3](https://reference.wolfram.com/language/ref/SquareFreeQ.html)

Categories: Testing, Math
