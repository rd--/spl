# arrayReshape

- _arrayReshape(c, ⍴, x=nil)_

Answer an array of shape _⍴_ and with elements drawn from the collection _c_.
If _c_ has too few items the missing values are set to _x_.
If _c_ has too many items it is an `error`.

Create a 4×2 matrix from a 2×4 matrix:

```
>>> [1 2 3 4; 5 6 7 8]
>>> .arrayReshape([4 2])
[
	1 2;
	3 4;
	5 6;
	7 8
]
```

Create a 3×3 matrix from a five-vector,
setting missing elements to `nil`:

```
>>> 5.iota.arrayReshape([3 3])
[
	  1   2   3;
	  4   5 nil;
	nil nil nil
]
```

Create a twelve-vector from a 2×2 matrix,
set missing items to zero:

```
>>> [1 2; 3 4].arrayReshape([12], 0)
[1 2 3 4 0 0 0 0 0 0 0 0]
```

It is an error if there are too many items:

```
>>> {
>>> 	9.iota.arrayReshape([2 2])
>>> }.hasError
true
```

`arrayReshape` can decrease the rank or bound of a list.
Create a nine-vector from a 3×3 matrix:

* * *

See also: rank, reshape, reshapeLike, shape

Guides: Array Functions, List Functions, Matrix Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayReshape.html)
