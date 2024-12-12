# isSquareFree

- _isSquareFree(anInteger)_

Answer `true` if _anInteger_ is square free, else `false`.
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

The first few squarefree numbers are:

```
>>> 1:15.select(isSquareFree:/1)
[1 2 3 5 6 7 10 11 13 14 15]
```

A number is squareful, or nonsquarefree, if it contains at least one square.
The first few squareful numbers are:

```
>>> 1:25.select { :each |
>>> 	each.isSquareFree.not
>>> }
[4 8 9 12 16 18 20 24 25]
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
