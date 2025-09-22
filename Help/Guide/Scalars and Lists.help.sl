# Scalars and Lists

A scalar is any non-composite value.
Lists are written between square brackets.
Addition is written infix using the `+` sign.

Scalar addition answers a scalar:

```
>>> 3 + 4
7
```

Scalar and vector addition is pointwise over the vector:

```
>>> 3 + [4 6 8]
[7 9 11]
```

The vector may appear on either side:

```
>>> [3 5 7] + 4
[7 9 11]
```

A matrix is a vector of vectors:

```
>>> [3 5 7; 7 9 11] + 4
[7 9 11; 11 13 15]
```

Vector addition is pointwise if the vectors are of equal size:

```
>>> [3 5 7] + [8 6 4]
[11 11 11]
```

If the vectors are of different sizes the shorter vector is recyled, as in R & S & SuperCollider:

```
>>> [3 4 5] + [4 5 6 7 8 9]
[7 9 11 10 12 14]

>>> 3:5 + 4:9
[7 9 11 10 12 14]
```

There are a number of alternate behaviours that can be selected using `Operator Adverbs`.
Require that the vectors be of equal size:

```
>>> [1 2 3] +.e [4 5 6]
[5 7 9]

>>> {[1 2 3] +.e [4 5 6 7] }.hasError
true
```

* * *

See also: +

Guides: Matrix Syntax, Operator Adverbs, Vector Syntax
