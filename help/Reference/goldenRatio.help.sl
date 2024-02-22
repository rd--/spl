# goldenRatio

_goldenRatio(aNumber)_

Answer _aNumber_ × the golden ratio, half of the square root of five plus one:

```
>>> 1.goldenRatio
1.61803

>>> 2.goldenRatio
(5.sqrt + 1)
```

Compute the Fibonacci numbers:

```
>>> 1:20.collect { :n | (1.goldenRatio ^ n / 5.sqrt).rounded }
[1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765]

>>> 20.fibonacciList
[1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765]
```

Position of 1s in a Fibonacci substitution system:

```
>>> 1:30.collect { :n | 2 - ((n + 1).goldenRatio.floor - n.goldenRatio.floor) }
[0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0]

>>> [0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0].scan(+)
[0 1 1 1 2 2 3 3 3 4 4 4 5 5 6 6 6 7 7 8 8 8 9 9 9 10 10 11 11 11]
```

Compute the effective "inverse" of the Fibonacci numbers:

```
>>> 1:25.collect { :n | (n * 5.sqrt).log(1.goldenRatio).rounded }
[2 3 4 5 5 5 6 6 6 6 7 7 7 7 7 7 8 8 8 8 8 8 8 8 8]
```

As continued fraction:

```
>>> 1.goldenRatio.continuedFraction(20)
(1 # 20)
```

Plot the fractional part of multiples of the golden ratio:

~~~
1:100.collect { :n | n.goldenRatio.fractionPart }.plot
~~~

* * *

See also: e, [Mathematical Constants], pi

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GoldenRatio.html)
[2](https://reference.wolfram.com/language/ref/GoldenRatio.html)
