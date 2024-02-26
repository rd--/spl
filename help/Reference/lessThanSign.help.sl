# <

- _aMagnitude < anotherMagnitude_

Answers _true_ if _aMagnitude_ is comparable with and less than _anotherMagnitude_.
Also known as strong inequality or strict inequality.

At `Integer`:

```
>>> 3 < 5
true
```

At `SmallFloat`:

```
>>> 3.4 < 5.6
true
```

At `Fraction`:

```
>>> 3/4 < 5/6
true
```

At `String`:

```
>>> '3' < '5'
true

>>> 'five' < 'three'
true
```

At `Complex`, inequalities are defined only for real numbers:

```
>>> { 3j3 < 5j5 }.ifError { true }
true
```

Element-wise at `Sequence`:

```
>>> [1 3 5 7 9] < [3 4 5 6 7]
[true true false false false]
```

`String` and `Number` cannot be compared:

```
>>> { '3' < 5 }.ifError { true }
true

>>> { 3 < '5' }.ifError { true }
true
```

The name of this operator is _lessThanSign_.

* * *

See also: <=, >, >=, <=>, Magnitude

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Less.html)

Categories: Comparison operator
