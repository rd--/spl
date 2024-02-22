# sqrt

- _sqrt(aNumber)_

Answer the number that, multiplied with itself, is _aNumber_.

```
>>> 3.sqrt
1.73205

>>> 7.sqrt
2.64575

>>> 200.sqrt
(10 * 2.sqrt)
```

Negative numbers have imaginary square roots:

```
>>> -25j0.sqrt
0j5
```

At Complex:

```
>>> 5j1.sqrt
2.24711j0.22250
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 0j1 pi inf].sqrt
[0, 1.22474, -1j0 ^ 0.25, pi.sqrt, inf]

>>> [1 4 9 16].sqrt
[1 2 3 4]
```

Values at zero and infinity:

```
>>> 0.sqrt
0

>>> inf.sqrt
inf
```

Plot over a subset of the reals:

~~~
(0, 0.01 .. 10).sqrt.plot
~~~

* * *

See also: squared

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SquareRoot.html)
[2](https://reference.wolfram.com/language/ref/Sqrt.html)

Unicode: U+221A √ Square Root

Categories: Mathematical functions
