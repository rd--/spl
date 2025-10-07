# Operator Precedence

There are no precedence rules among operators,
evaluation is from left to right.

```
>>> 3 + 4 * 5
35

>>> 4 ^ 3 ^ 2
4096
```

Parentheses are required to follow the usual mathematical conventions.

```
>>> 3 + (4 * 5)
23

>>> 4 ^ (3 ^ 2)
262144
```

Operators have lower precedence than `Method Syntax`:

```
>>> 7 + 9.sqrt
10

>>> (7 + 9).sqrt
4
```

`Apply Syntax` is in any case parenthesised:

```
>>> sqrt(9) + 7
10

>>> sqrt(9 + 7)
4
```

Use parentheses to evaluate from right to left:

```
>>> -1 - 2 - 3
-6

>>> -1 - (2 - 3)
0
```

* * *

See also: Operator Syntax
