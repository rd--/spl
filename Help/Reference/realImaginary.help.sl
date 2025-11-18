# realImaginary

- _realImaginary(z)_

Answer the `real` and `imaginary` parts of the number _z_.

At `Complex`:

```
>>> 1J2.realImaginary
[1 2]
```

At `Quaternion`:

```
>>> Quaternion([1 2 3 4]).realImaginary
[1, [2 3 4]]
```

Threads over lists:

```
>>> [-1, -2 .. -5].sqrt.realImaginary
[
	5 # [0],
	1:5.sqrt
].transpose
```

At `SmallFloat` and `LargeInteger` and `Fraction`:

```
>>> [3.141 23L 5/7].realImaginary
[
	3.141 0;
	23L 0;
	5/7 0
]
```

* * *

See also: asList, Complex, i, j, real, imaginary

Guides: Complex Number Functions, Quaternion Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ReIm.html)

Categories: Math, Accessing
