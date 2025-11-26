# times

- _m * n_

Answer the number _m_ multiplied by _n_.
The operator form is `*`.

```
>>> 2 * 3 * 4
24

>>> -5 * 12
-60
```

Threads element-wise over lists:

```
>>> 2 * [3 4 5]
[6 8 10]

>>> [2 3 4] * 5
[10 15 20]

>>> [1 2 3] * [4 5 6]
[4 10 18]
```

Vector times matrix:

```
>>> [-1 0 1] * [1 2; 3 4; 5 6]
[[-1, -2], [0, 0], [5, 6]]

>>> [-1 1] * [1 2; 3 4; 5 6]
[-1 -2; 3 4; -5 -6]
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
>>> [1 2; 3 4] * [1 0; 3 2]
[1 0; 9 8]

>>> [1 2; 3 4; 5 6] * [-1 1; 0 0; 1 -1]
[-1 2; 0 0; 5 -6]

>>> [1 2; 3 4; 5 6] * [-1 1; 1 -1]
[-1 2; 3 -4; -5 6]
```

For the matrix product see `dot`:

```
>>> [1 2; 3 4].dot([1 0; 3 2])
[7 4; 15 8]
```

As argument to `reduce`:

```
>>> 1:9.reduce(*)
362880
```

Evaluate using both apply and method send syntaxes:

```
>>> *(3, 4)
12

>>> 3.*(4)
12
```

At `Symbol`:

```
>> `m` * `n`
(* m n)

>> `m`.*
(if (> m 0) 1 (if (< m 0) -1 0))
```

* * *

See also: *, +, -, /, ^, *+, cross, dot, product, sign

Guides: Binary Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/Times),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-42-),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/star),
_Mathematica_
[1](https://mathworld.wolfram.com/Times.html)
[2](https://reference.wolfram.com/language/ref/Times.html),
_Smalltalk_
5.6.2.1,
_W_
[1](https://en.wikipedia.org/wiki/Multiplication)
[2](https://en.wikipedia.org/wiki/Hadamard_product_(matrices))

Categories: Math, Operator
