# fibonacciEntryPoint

- _fibonacciEntryPoint(n)_

Answer the least _k>=1_ such that _n_ divides Fibonacci number _F(k)_.

The Fibonacci entry points,
OEIS [A001177](https://oeis.org/A001177):

```
>>> 1:17.collect(fibonacciEntryPoint:/1)
[1 3 4 6 5 12 8 6 12 15 10 12 7 24 20 12 9]
```

The Fibonacci entry points,
OEIS [A001177](https://oeis.org/A001177):

~~~spl svg=A oeis=A001177
1:100.collect(
	fibonacciEntryPoint:/1
).discretePlot
~~~

![](Help/Image/fibonacciEntryPoint-A.svg)

* * *

See also: fibonacci

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A001177)
