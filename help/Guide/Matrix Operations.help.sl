# Matrix Operations

Addition, calculated entrywise:

```
>>> [1 3 1; 1 0 0] + [0 0 5; 7 5 0]
[1 3 6; 8 5 0]
```

Scalar multiplication:

```
>>> 2 * [1 8 -3; 4 -2 5]
[2 16 -6; 8 -4 10]
```

Transposition:

```
>>> [1 2 3; 0 -6 7].transposed
[1 0; 3 -6; 3 7]
```

Matrix multiplication:

```
>>> [2 3 4; 1 0 0].dot([0 1000; 1 100; 0 10])
[3 2340; 0 1000]

>>> [3 1; 4 1] dot: [1 2 3; 4 5 6]
[7 11 15; 8 13 18]
```

Matrix multiplication is not commutative:

```
>>> [1 2; 3 4] dot: [0 1; 0 0]
[0 1; 0 3]

>>> [0 1; 0 0] dot: [1 2; 3 4]
[3 4; 0 0]
```

Vector & matrix multiplication:

```
>>> [1 2 3; 4 5 6] dot: [1 1 1]
[6 15]

>>> let v = [1 1 -4];
>>> let m = [1 2 3; 3 2 1; 1 1 1];
>>> (v dot: m, m dot: v)
([0 0 0], [-9 1 -2])
```

* * *

See also: trace
