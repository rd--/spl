# fibonacci

- _fibonacci(n)_

Answer the Fibonacci number _F(n)_.

Threads over lists:

```
>>> 1:20.fibonacci
[1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765]
```

Plot over a subset of the reals:

~~~
(-2 -- 2).subdivide(500).fibonacci.plot
~~~

The sequence of _F(n) % m_ is periodic with respect to _n_ for a fixed natural number _m_:

~~~
(0:35.fibonacci % 7).plot
~~~

Fibonacci numbers modulo 10:

~~~
(1:100.fibonacci % 10).plot
~~~

Fibonacci modulo _n_:

~~~
1:200.collect { :n | n.fibonacci % n }.plot
~~~

Log plot of positive and negative Fibonacci numbers:

~~~
(-10 -- 10).subdivide(500).collect { :x | (x.fibonacci.abs + 1).log }.plot
~~~

* * *

See also: fibbonaciList, goldenRatio

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Fibonacci.html)
