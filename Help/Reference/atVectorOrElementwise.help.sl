# atVectorOrElementwise

- _atVectorOrElementwise([x₁ x₂ …], f/1)_

If _x_ is empty,
according to `isEmpty`,
answer _x_.
If _x_ is a vector,
according to `isVector`,
answer _f(x)_.
Otherwise recurse over each item in _x_.

```
>>> [1 2 3 4 5 6 7 8]
>>> .atVectorOrElementwise(sum/1)
36

>>> [1 2 3 4; 5 6 7 8]
>>> .atVectorOrElementwise(sum/1)
[10 26]

>>> [1 2; 3 4:; 5 6; 7 8]
>>> .atVectorOrElementwise(sum/1)
[3 7; 11 15]
```

* * *

See also: atIntegerOrElementwise, atMatrixOrElementwise
