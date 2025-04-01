# cayleyMengerDeterminant

- _cayleyMengerDeterminant(p)_

Answer the Cayley-Menger determinant of the simplex spanned by points _p_.

Compute the area of a triangle:

```
>>> [0 0; 1 2; 2 1]
>>> .cayleyMengerDeterminant
3 / 2
```

Compute the volume of a tetrahedron:

```
>>> [1 0 0; 1 0 1; 1 1 1; 0 0 1]
>>> .cayleyMengerDeterminant
1/6
```

Compute the content of a four-dimensional simplex:

```
>>> [0 0 0 0; 1 0 0 0; 1 1 0 0; 1 1 1 0; 1 1 1 1]
>>> .cayleyMengerDeterminant
1/24
```

* * *

See also: cayleyMengerMatrix

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cayley-MengerDeterminant.html),
_W_
[1](https://en.wikipedia.org/wiki/Cayley%E2%80%93Menger_determinant)
