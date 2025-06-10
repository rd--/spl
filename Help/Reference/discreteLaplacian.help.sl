# discreteLaplacian

- _discreteLaplacian([x₁ x₂ …], h)_

Answer a discrete approximation of Laplace’s differential operator applied to a vector,
with uniform spacing _h_.

Calculate the acceleration of an object from a vector of position data:

```
>>> [1 3 6 10 16 18 29]
>>> .discreteLaplacian(1) * 4
[1 1 1 2 -4 9 22]

>>> [1 1 2 3 5 8 13 21]
>>> .discreteLaplacian(1) * 4
[2 1 0 1 1 2 3 4]
```

Calculate the discrete Laplacian of a cosine vector,
which is analytically negated signal:

~~~spl svg=A
>>> let x = (-2.pi -- 2.pi).discretize(100);
>>> let y = x.cos;
>>> let h = x[2] - x[1];
>>> [y, y.discreteLaplacian(h) * 4].linePlot
~~~

![](sw/spl/Help/Image/discreteLaplacian-A.svg)

* * *

See also: differences, gradient

References:
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/del2.html)
