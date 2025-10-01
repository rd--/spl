# subfactorial

- _subfactorial(n)_

Answers the number of permutations of _n_ objects that leave no object fixed.

A permutation in which no object appears in its natural place is called a derangement.
The subfactorial counts the number of derangements.

```
>>> 6.subfactorial
265

>>> (6.factorial / 1.e).round
265

>>> 1:9.collect(subfactorial:/1)
[0 1 2 9 44 265 1854 14833 133496]

>>> 20.subfactorial
895014631192902121L
```

The number of derangements of an _n_-element set for small _n_,
OEIS [A000166](https://oeis.org/A000166):

```
>>> 0:13.collect(subfactorial:/1)
[
	        1          0        1
	        2          9       44
	      265       1854    14833
	   133496    1334961 14684570
	176214841 2290792932
]
```

Plot the values on a `log` scale over a subset of the reals:

~~~spl svg=A
2:19.functionPlot { :x |
	x.subfactorial.log
}
~~~

![](sw/spl/Help/Image/subfactorial-A.svg)

* * *

See also: derangements, doubleFactorial, factorial

Guides: Combinatorial Functions, Permutation Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Subfactorial.html)
[2](https://reference.wolfram.com/language/ref/Subfactorial.html)
