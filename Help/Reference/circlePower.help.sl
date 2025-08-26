# circlePower

- _circlePower(p, c)_

Answer the power of the fixed point _p_ with respect to a circle _c_.

For _p_ outside _c_:

```
>>> [-2 -2; -1 -1; 1 1; 2 2]
>>> .circlePower(Circle([0 0], 1))
[7 1 1 7]
```

For _p_ on _c_:

```
>>> [-1 0; 0 -1; 0 1; 1 0]
>>> .circlePower(Circle([0 0], 1))
[0 0 0 0]
```

For _p_ inside _c_:

```
>>> [-0.5 -0.5; 0 0; 0.5 0.5]
>>> .circlePower(Circle([0 0], 1))
[-0.5 -1 -0.5]
```

* * *

See also: Circle, circleInversion

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CirclePower.html),
_W_
[1](https://en.wikipedia.org/wiki/Power_of_a_point)
