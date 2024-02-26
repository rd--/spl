# *

- _aNumber.*_
- _aNumber * anotherNumber_

Answer _aNumber_ multiplied by _anotherNumber_.

```
>>> 2 * 3 * 4
24
```

Threads element-wise over lists:

```
>>> 2 * [3 4 5]
[6 8 10]

>>> [2 3 4] * 5
[10 15 20]
```

Matrix times vector:

```
>>> [1 2; 3 4; 5 6] * [-1 0 1]
[-1 -2; 0 0; 5 6]

>>> [1 2; 3 4; 5 6] * [-1 1]
[-1 -2; 3 4; -5 -6]
```

Matrix times matrix:

```
>>> [1 2; 3 4; 5 6] * [-1 1; 0 0; 1 -1]
[-1 2; 0 0; 5 -6]

>>> [1 2; 3 4; 5 6] * [-1 1; 1 -1]
[-1 2; 3 -4; -5 6]
```

As argument to reduce:

```
>>> 1:9.reduce(*)
362880
```

Apply and method send syntaxes:

```
>>> *(3, 4)
12

>>> 3.*(4)
12
```

The unary form is _sign_:

```
>>> pi.*
1

>>> [-3 0 3].*
[-1 0 1]
```

The name of this operator is _asterisk_.

Where supported * is displayed as ×.

* * *

See also: +, -, /, sign, product

Unicode: U+00D7 × Multiplication Sign

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/star),
_Mathematica_
[1](https://mathworld.wolfram.com/Times.html)
[2](https://reference.wolfram.com/language/ref/Times.html)

Categories: Math, Operator
