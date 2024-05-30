# cramersRule

- _cramersRule(aMatrix, aVector)_

Cramer’s rule is an explicit formula for the solution of a system of linear equations with as many equations as unknowns,
valid whenever the system has a unique solution.

Use Cramer’s rule to solve a system of linear equations with as many equations as unknowns:

```
>>> let m = [2 -1 5 1; 3 2 2 -6; 1 3 3 -1; 5 -2 -3 3];
>>> let b = [-3 -32 -47 49];
>>> m.cramersRule(b)
[2 -12 -4 1]
```

Solve _-2x + y = 1_ and _-3x + 2y = 5_:

```
>>> [-2 1; -3 2].cramersRule([1 5])
[3 7]
```

Solve _2x + y = 7_ and _3x - y = 8_:

```
>>> [2 1; 3 -1].cramersRule([7 8])
[3 1]
```

Solve _2x + 3y = 4_ and _x - 2y = -5_:

```
>>> [2 3; 1 -2].cramersRule([4 -5])
[-1 2]
```

Solve _0.82x - 0.03y = 26.53_ and _-0.21x + 0.96y = 36.06_:

```
>>> [0.82 -0.03; -0.21 0.96].cramersRule([26.53 36.06])
[34 45]
```

_-4x + 3y = 15_ and _-12x + 9y = 18_ are parallel lines so there is no solution:

```
>>> [-4 3; -12 9].cramersRule([15 18])
[inf inf]
```

_2x + 5y = 45_ and _6x - 15y = -135_ are equal lines so there are infinite solutions, one of which is:

```
>>> [2 5; 6 -15].cramersRule([45 -135])
[0 9]
```

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CramersRule.html),
_W_
[1](https://en.wikipedia.org/wiki/Cramer%27s_rule)
