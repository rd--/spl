# pellNumber

- _pellNumber(n)_

Answer the _n_-th Pell number, zero-indexed.

```
>>> 9.pellNumbers
0:8.collect(pellNumber:/1)
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

* * *

See also: pellNumbers, pellLucasNumbers

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PellNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Pell_number)

Categories: Math
