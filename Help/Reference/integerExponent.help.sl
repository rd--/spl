# integerExponent

- _integerExponent(n, b)_

Answers the highest power of _b_ that divides _n_.

The number of trailing zeros:

```
>>> 1230000.integerExponent(10)
4
```

The highest power of 2:

```
>>> ((2 ^ 10) + (2 ^ 7)).integerExponent(2)
7
```

Number of trailing zeros in factorials:

```
>>> (1n .. 40n).collect { :n | n.factorial.integerExponent(10) }
[0 0 0 0 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 6 6 6 6 6 7 7 7 7 7 8 8 8 8 8 9]
```

Powers of 2 in successive integers:

```
>>> 1:40.collect { :n | n.integerExponent(2) }
[0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0 5 0 1 0 2 0 1 0 3]
```

A formula for digitCount:

```
>>> (1n .. 30n).collect { :n | n - n.factorial.integerExponent(2) }
[1 1 2 1 2 2 3 1 2 2 3 2 3 3 4 1 2 2 3 2 3 3 4 2 3 3 4 3 4 4]
```

Plot it:

~~~
(1:127).functionPlot { :n |
	n.integerExponent(2)
}
~~~

* * *

See also: ^, digitCount, factorInteger, integerDigits, log2, log10

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/IntegerExponent.html)
