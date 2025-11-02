# last

- _last([x₁ x₂ …])_
- _last([x₁ x₂ …], n)_
- _last([x₁ x₂ …], n, z)_

The unary form answers the last element of the sequence _x_.

```
>>> 1:6.last
6

>>> (6, 5 .. 1).last
1
```

It is an error if the sequence is empty:

```
>>> {
>>> 	[].last
>>> }.hasError
true
```

The binary form answers the last _n_ elements of the sequence _x_:

```
>>> 1:99.last(23)
77:99

>>> [3 .. 9].last(4)
[6 7 8 9]
```

The ternary form will fill missing places with the specified value _z_.
Convert a list to a fixed size:

```
>>> [3 1 4 1 5 9 6 2 3 5].last(6, 0)
[5 9 6 2 3 5]

>>> [2 3 5].last(6, 0)
[0 0 0 2 3 5]
```

* * *

See also: drop, first, middle, take

Guides: List Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlyrtdot#dyadic)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Last.html),
_Smalltalk_
5.7.8.25

Categories: Accessing
