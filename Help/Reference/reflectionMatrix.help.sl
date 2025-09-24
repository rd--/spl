# reflectionMatrix

- _reflectionMatrix(θ)_
- _reflectionMatrix([x₁ x₂ …])_

Answer a reflection matrix, either about an angle _θ_ or a vector _x_.

Reflection about an angle:

```
>>> 0.reflectionMatrix
[1 0; 0 -1]

>>> 1/2.pi.reflectionMatrix
[-1 0; 0 1]
```

Reflection about a two vector:

```
>>> [1 0].reflectionMatrix
[1 0; 0 -1]

>>> [0 1].reflectionMatrix
[-1 0; 0 1]
```

Reflection about a three vector:

```
>>> [1 1 1].reflectionMatrix
[
	 1/3 -2/3 -2/3;
	-2/3  1/3 -2/3;
	-2/3 -2/3  1/3
]
```

* * *

See also: rotationMatrix, scalingMatrix

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Reflection.html)
[2](https://reference.wolfram.com/language/ref/ReflectionMatrix.html)

Categories: Geometry, Matrix
