# pellNumber

- _pellNumber(n)_

Answer the _n_-th Pell number, zero-indexed.

```
>>> 9.pellNumbers
0:8.collect(pellNumber:/1)
```

At non-integer values:

```
>>> 1.25.pellNumber
1.14703
```

Approximations of the square root of two:

```
>>> let f = { :n |
>>> 	let p = n.pellNumber;
>>> 	let q = (n - 1).pellNumber;
>>> 	(q + p) / p
>>> };
>>> 1:7.collect(f:/1)
[1 1.5 1.4 1.4167 1.4138 1.4143 1.4142]

>>> 2.sqrt
1.4142
```

Pell numbers can be used to form Pythagorean triples:

```
>>> let p = { :x |
>>> 	x.pellNumber.rounded
>>> };
>>> let n = 7;
>>> let a = 2 * p(n) * p(n + 1);
>>> let b = (p(n + 1) ^ 2) - (p(n) ^ 2);
>>> let c = p((2 * n) + 1);
>>> (a, b, c, isPythagoreanTriple(a, b, c))
(137904, 137903, 195025, true)
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(pellNumber:/1)
~~~

![](sw/spl/Help/Image/pellNumber-A.svg)

* * *

See also: pellNumbers, pellLucasNumbers

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PellNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Pell_number)

Categories: Math
