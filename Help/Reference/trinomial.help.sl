# trinomial

- _trinomial(n, k)_

Answer the trinomial coefficient _n,k_.

With positive integer _n_ and _k_:

```
>>> 4.trinomial(2)
10

>>> 6.trinomial(3)
50

>>> 8.trinomial(4)
266

>>> 8.trinomial(5)
504
```

_n_ less than _k_:

```
>>> 3.trinomial(5)
3

>>> 5.trinomial(23)
0
```

Real valued arguments:

```
>>> 8.5.trinomial(-4.2)
0.011897

>>> 2.trinomial(0.5)
1.436942
```

_k_ may be a collection:

```
>>> [10 1 2 5].collect { :each |
>>> 	10.trinomial(each)
>>> }
[8953 10 55 1452]

>>> 10.trinomial([10 1 2 5])
[8953 10 55 1452]
```

Evaluate for half-integer arguments:

```
>>> (9 / 2).trinomial(7 / 2)
(9 / 2)26.869537
```

Make the trinomial triangle:

```
>>> 0:6.collect { :n |
>>> 	let k = [0 .. n * 2];
>>> 	n.trinomial(k)
>>> }
[
	1;
	1 1 1;
	1 2 3 2 1;
	1 3 6 7 6 3 1;
	1 4 10 16 19 16 10 4 1;
	1 5 15 30 45 51 45 30 15 5 1;
	1 6 21 50 90 126 141 126 90 50 21 6 1
]
```

At `zero`:

```
>>> 0.trinomial(0)
1

>>> 0.trinomial(1)
0

>>> 1.trinomial(0)
1
```

Threads over lists:

```
>>> 5.trinomial([3 4 5])
[30 45 51]

>>> 11:13.trinomial(1:3)
[11 78 442]

>>> [
>>> 	11.trinomial(1),
>>> 	12.trinomial(2),
>>> 	13.trinomial(3)
>>> ]
[11 78 442]
```

Plot over a subset of the reals as a function of its first parameter:

~~~spl svg=A
(-1.975 -- 4).functionPlot { :x |
	x.trinomial(3)
}
~~~

![](sw/spl/Help/Image/trinomial-A.svg)

Plot over a subset of the reals as a function of its second parameter:

~~~spl svg=B
(-1.975 -- 4).functionPlot { :x |
	3.trinomial(x)
}
~~~

![](sw/spl/Help/Image/trinomial-B.svg)

* * *

See also: binomial, factorial, multinomial

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TrinomialCoefficient.html)
[2](https://mathworld.wolfram.com/TrinomialTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Trinomial_triangle)

Categories: Math, Combinatorics
