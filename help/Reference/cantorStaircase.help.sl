# cantorStaircase

- _cantorStaircase(x, n)_
- _cantorStaircase(alpha)_ => _cantorStaircase(alpha, 12)_

Answer the Cantor staircase function.

```
>>> 0.3.cantorStaircase(3)
0.3875

>>> 0.1.cantorStaircase(0)
0.1

>>> 0.29.cantorStaircase(4)
0.375

>>> 0.11.cantorStaircase(5)
0.2415625

>>> (1 / 3).cantorStaircase(2)
1/2

>>> 0.76.cantorStaircase(4)
0.6875

>>> 0.cantorStaircase(1)
0

>>> (15 / 17).cantorStaircase(2)
3/4

>>> (1 / 2.sqrt).cantorStaircase(3)
0.625
```

Threads elementwise over lists:

```
>>> (0:9  / 9).cantorStaircase
[0 0.25 0.25 0.5 0.5 0.5 0.5 0.75 0.75 1]
```

Plot over the unit interval:

~~~
(0 -- 1).discretize(500).cantorStaircase.plot
~~~

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CantorFunction.html)
[2](https://reference.wolfram.com/language/ref/CantorStaircase.html)
