# carmichaelLambda

- _carmichaelLambda(n)_

Answer the Carmichael function _λ(n)_,
also called the reduced totient function.

Compute the Carmichael lambda function:

```
>>> 4.carmichaelLambda
2

>>> 10.carmichaelLambda
4
```

The first few terms,
OEIS [A002322](https://oeis.org/A002322):

```
>>> 1:81.collect(carmichaelLambda:/1)
[
	 1  1  2  2  4  2  6  2  6  4
	10  2 12  6  4  4 16  6 18  4
	 6 10 22  2 20 12 18  6 28  4
	30  8 10 16 12 6  36 18 12  4
	40  6 42 10 12 22 46  4 42 20
	16 12 52 18 20  6 18 28 58  4
	60 30  6 16 12 10 66 16 22 12
	70  6 72 36 20 18 30 12 78  4
	54
]
```

The `lcm` of `carmichaelLambda` is equal to `carmichaelLambda` of the `lcm`:

```
>>> [3 8].collect(
>>> 	carmichaelLambda:/1
>>> ).lcm
2

>>> [3 8].lcm.carmichaelLambda
2
```

`carmichaelLambda` divides `eulerPhi`:

```
>>> 8.eulerPhi / 8.carmichaelLambda
2
```

If _n_ has a primitive root, then `carmichaelLambda` and `eulerPhi` are the same:

```
>>> 18.primitiveRootList
[5 11]

>>> 18.carmichaelLambda
6

>>> 18.eulerPhi
6
```

First few Carmichael numbers,
OEIS [A002997](https://oeis.org/A002997):

```
>>> [561 1105 1729 2465 2821 6601 8911]
>>> .allSatisfy { :n |
>>> 	n.isComposite & {
>>> 		n.mod(n.carmichaelLambda) = 1
>>> 	}
>>> }
true
```

Discrete plot of the first few terms:

~~~spl svg=A
1:50.collect(carmichaelLambda:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/carmichaelLambda-A.svg)

Scatter plot of the first few terms:

~~~spl svg=B
1:250.collect(carmichaelLambda:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/carmichaelLambda-B.svg)

* * *

See also: eulerPhi, factorInteger, isCarmichaelNumber, isCoprime, isPrimePower, isSquareFree, lcm, multiplicativeOrder, primitiveRootList

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CarmichaelFunction.html)
[2](https://mathworld.wolfram.com/CarmichaelNumber.html)
[3](https://reference.wolfram.com/language/ref/CarmichaelLambda.html),
_OEIS_
[1](https://oeis.org/A002322)
[2](https://oeis.org/A002997),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.reduced_totient),
_W_
[1](https://en.wikipedia.org/wiki/Carmichael_function)
[2](https://en.wikipedia.org/wiki/Carmichael_number)

Unicode: U+03BB λ Greek Small Letter Lamda
