# isArithmeticProgressionBy

- _isArithmeticProgressionBy(aSequence, anInteger, aBlock:/2)_

Answer `true` if _aSequence_ is an arithmetic series by _anInteger_,
with distances considered equal according to _aBlock_.

At `List`:

```
>>> [1 3 5 7 9]
>>> .isArithmeticProgressionBy(2, =)
true

>>> [1 3 5 7 9]
>>> .isArithmeticProgressionBy(3, =)
false
```

At `Range`:

```
>>> (1, 3 .. 9)
>>> .isArithmeticProgressionBy(2, =)
true

>>> (1, 3 .. 9)
>>> .isArithmeticProgressionBy(3, =)
false
```

Taking into account small errors:

```
>>> (1, 1.1 .. 9)
>>> .isArithmeticProgressionBy(0.1, =)
false

>>> (1, 1.1 .. 9)
>>> .isArithmeticProgressionBy(0.1, ~)
true
```

* * *

See also: isArithmeticProgression, isGeometricProgression, Range

Categories: Testing
