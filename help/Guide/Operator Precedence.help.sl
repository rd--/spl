# Operator Precedence

There are no operator precedence rules, evaluation is strictly from left to right.

Parentheses are required to follow the usual mathematical conventions.

```
>>> [3 + 4 * 5, 3 + (4 * 5)]
[35, 23]
```

Use parentheses to evaluate from right to left:

```
>>> [-1 - 2 - 3, -1 - (2 - 3)]
[-6, 0]
```
