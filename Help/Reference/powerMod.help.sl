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
```

Threads over first argument:

```
>>> 1:4.powerMod(4, 5)
[1 1 1 1]
```

Use `powerMod` to generate all coprime integers modulo 9:

```
>>> 2:10.collect { :each |
>>> 	2.powerMod(each, 9)
>>> }.asIdentitySet.sorted
[1 2 4 5 7 8]
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
let n = 22.nthPrime;
1:n.functionPlot { :x |
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
[1](https://mathworks.com/help/symbolic/sym.powermod.html)
