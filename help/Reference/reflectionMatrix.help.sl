# reflectionMatrix

- _reflectionMatrix(aNumber)_
- _reflectionMatrix(aList)_

Answer a reflection matrix, either about an angle or a vector.

Reflection about an angle:

```
>>> 0.reflectionMatrix
[1 0; 0 -1]

>>> (pi / 2).reflectionMatrix
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

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Reflection.html)
[2](https://reference.wolfram.com/language/ref/ReflectionMatrix.html)
