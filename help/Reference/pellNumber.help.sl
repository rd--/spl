# pellNumber

- _pellNumber(anInteger)_

Answer a _anInteger_-th Pell number, zero-indexed.

```
>>> 9.pellNumbers
0:8.collect(pellNumber:/1)
```

Approximations of the square root of two:

```
>>> let f = { :n |
>>> 	((n - 1).pellNumber + n.pellNumber) / n.pellNumber
>>> };
>>> 1:7.collect(f:/1)
[1 1.5 1.4 1.4167 1.4138 1.4143 1.4142]

>>> 2.sqrt
1.4142
```

* * *

See also: pellNumbers, pellLucasNumbers

Categories: Math
