# isArithmeticProgression

- _isArithmeticProgression([x₁ x₂ …], n, f:/2)_

Answer `true` if the sequence _x_ is an arithmetic series by step _n_,
with distances considered equal according to the block _f_.

At `List`:

```
>>> [1 3 5 7 9]
>>> .isArithmeticProgression(2, =)
true

>>> [1 3 5 7 9]
>>> .isArithmeticProgression(3, =)
false
```

At `Range`:

```
>>> (1, 3 .. 9)
>>> .isArithmeticProgression(2, =)
true

>>> (1, 3 .. 9)
>>> .isArithmeticProgression(3, =)
false
```

Taking into account small errors:

```
>>> (1, 1.1 .. 9)
>>> .isArithmeticProgression(0.1, =)
false

>>> (1, 1.1 .. 9)
>>> .isArithmeticProgression(0.1, ~)
true
```

Ascending arithmetic sequence with step size of one:

```
>>> [1 2 3 4 5].isArithmeticProgression
true
```

Descending arithmetic sequence with step size of one:

```
>>> [7 6 5 4 3].isArithmeticProgression
true
```

The `differences` of an arithmetic sequence are all equal:

```
>>> let x = [1 3 5 7 9];
>>> (
>>> 	x.isArithmeticProgression,
>>> 	x.differences
>>> )
(true, [2 2 2 2])
```

* * *

See also: arithmeticProgression, asRange, isGeometricProgression, Range

Guides: List Functions

Categories: Testing
