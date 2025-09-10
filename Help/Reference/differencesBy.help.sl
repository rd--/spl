# differencesBy

- _differencesBy([x₁ x₂ …], f:/2)_

Answer the successive differences of elements in the sequence _x_ according to _f_.

At `Range`:

```
>>> 1:5.differencesBy(-)
[1 1 1 1]
```

At `List`:

```
>>> [3 4 1 1].differencesBy(-)
[1 -3 0]

>>> [1 1 2 3 5 8 13 21].differencesBy(-)
[0 1 1 2 3 5 8]

>>> [1 2 4 7 0].differencesBy(-)
[1 2 3 -7]
```

Distances between successive Cartesian vectors:

```
>>> [0 0; 1 0; 0 1; 0 0]
>>> .differencesBy(euclideanDistance:/2)
[1 2.sqrt 1]

>>> [0 0; 1 0; 1 1; 0 1; 0 0]
>>> .differencesBy(euclideanDistance:/2)
[1 1 1 1]
```

Use `complement` to find the elements of each sublist that are absent from the proceeding sublist:

```
>>> [1 2; 1 3; 1 2 3 4]
>>> .differencesBy(complement:/2)
[3; 2 4]
```

The block need not be a subtraction:

```
>>> 1:10.differencesBy(*)
[2 6 12 20 30 42 56 72 90]
```

* * *

See also: -, differences, ratios

Guides: List Functions

Categories: Math
