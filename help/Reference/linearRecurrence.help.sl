# linearRecurrence

- _linearRecurrence(k, i, n)_

Answer the sequence of length _n_ obtained by iterating the linear recurrence with kernel _k_ starting with initial values _i_.

Solve an initial-value problem for a first-order difference equation with kernel _(-3, 1)_:

```
>>> linearRecurrence([-3 1], [7 2], 10)
[7 2 1 -1 4 -13 43 -142 469 -1549]
```

Find the first few Fibonacci numbers:

```
>>> linearRecurrence([1 1], [1, 1], 10)
[1 1 2 3 5 8 13 21 34 55]
```

Generate recursive sequences, including a Padovan sequence:

```
>>> linearRecurrence([0 1 1], [1 1 1], 10)
[1 1 1 2 2 3 4 5 7 9]
```

Pell numbers:

```
>>> linearRecurrence([2 1], [0 1], 10)
[0 1 2 5 12 29 70 169 408 985]
```

Pell–Lucas numbers:

```
>>> linearRecurrence([2 1], [2 2], 10)
[2 2 6 14 34 82 198 478 1154 2786]
```

Perrin sequence:

```
>>> linearRecurrence([0 1 1], [3 0 2], 10)
[3 0 2 3 2 5 5 7 10 12]
```

* * *

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LinearRecurrence.html)
