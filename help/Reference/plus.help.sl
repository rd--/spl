# +

- _aCollection.+_
- _aNumber + anotherNumber_

Answer sum of _aNumber_ and _anotherNumber_.

```
>>> 3 + 4
7

>>> 1 + 2 + 3
6

>>> 1 + 2 + 3/4
15/4
```

Complex numbers add their components:

```
>>> 2j1 + 3j-7
5j-6
```

Plus threads element-wise over lists:

```
>>> 0.1 + [3 4 5]
[3.1 4.1 5.1]

>>> [1 2 3] + [2 3 4]
[3 5 7]
```

List implements plus:

```
>>> [1 2 3] + [2 3 4]
[3 5 7]
```

Plus at SmallFloat is not always associative:

```
>>> 1e20 + (-1e20 + 1)
0

>>> (1e20 + -1e20) + 1
1
```

The unary form of _plus_ is _sum_:

```
>>> 1:9.+
45

>>> 1:9.reduce(+)
45
```

The name of this operator is _plus_.

* * *

See also: -, *, /, dividedBy, minus, sum, times

Unicode: U+002B + Plus Sign

References:
_Apl_
[1](https://aplwiki.com/wiki/Add),
_Mathematica_
[1](https://mathworld.wolfram.com/Plus.html)
[2](https://reference.wolfram.com/language/ref/Plus.html)

Categories: Mathematical operator
