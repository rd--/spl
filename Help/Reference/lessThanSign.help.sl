# < (lessThanSign)

- _x < y_
- _x.>_

The binary form answers `true` if _x_ is comparable with and less than _y_.
Also known as strong inequality or strict inequality.

At `Integer`:

```
>>> 3 < 5
true
```

At `SmallFloat`:

```
>>> 3.4 < 5.6
true
```

At `Fraction`:

```
>>> 3/4 < 5/6
true
```

At `Complex`, inequalities are defined only for real numbers:

```
>>> { 3J3 < 5J5 }.hasError
true
```

Element-wise at `Sequence`:

```
>>> [1 3 5 7 9] < [3 4 5 6 7]
[true true false false false]
```

`String` and `Number` cannot be compared with each other:

```
>>> { '5' < 3 }.hasError
true

>>> { 5 < '3' }.hasError
true
```

When the arguments to `<` are `boole`, it is the converse non-implication `Boolean` function:

```
>>> ([0 1] <.table [0 1]).boole
[0 1; 0 0]
```

Negative zero and positive zero are regarded as equal by the numerical comparison operations:

```
>>> -0 < 0
false
```

Create a mask to process a `List`,
selecting only items less than five:

```
>>> let x = [3 1 4 1 5 9 2 6];
>>> (x < 5).boole # x
[3 1 4 1 2]
```

The unary form is the operator for `floor`:

```
>>> 3.141.<
3
```

The name of this operator is `lessThanSign`.

* * *

See also: =, !=, <=, >, >=, <=>, Magnitude

Guides: Binary Operators, Comparison Functions, Sort Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Less_than),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Less.html),
_Smalltalk_
5.6.1.1,
_W_
[1](https://en.wikipedia.org/wiki/Converse_nonimplication)
[2](https://en.wikipedia.org/wiki/Inequality_(mathematics))

Categories: Comparing
