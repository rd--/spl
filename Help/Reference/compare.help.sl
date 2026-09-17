# compare

- _compare(x, y)_
- _compare([x₁ x₂ …], [y₁ y₂ …])_

Answer -1 if _x_ precedes _y_,
answer 0 if _x_ equals _y_,
answer 1 if _x_ succeeds _y_.

At `SmallFloat`:

```
>>> (compare(1, 2), 1 < 2)
(-1, true)

>>> (compare(1.e, 1.pi), 1.e < 1.pi)
(-1, true)
```

At `Fraction`:

```
>>> (compare(1/3, 1/2), 1/3 < 1/2)
(-1, true)
```

At `Complex`:

```
>>> (compare(1J2, 2J3), 1J2.abs < 2J3.abs)
(-1, true)
```

At `Boolean`:

```
>>> (compare(false, true), false.boole < true.boole)
(-1, true)
```

At sequences the comparison uses lexicographic ordering.

If all items of two sequences compare equal, the sequences are considered equal:

```
>>> [1 2 3].compare([1 2 3])
0
```

If two items at equal places differ, this determines the outcome of the comparison:

```
>>> [1 2 3].compare([3 2 1])
-1

>>> [1 2 3].compare([1 2 2])
1
```

If one sequence is an initial sub-sequence of the other,
the shorter sequence is the lesser one:

```
>>> [1 2 3].compare([1 2 3 4])
-1

>>> ['a' 'b' 'c' 'd'].compare(['a' 'b'])
1

>>> 'ab'.compare('abcd')
-1
```

At matrix:

```
>>> [1 2 3; 4 5 6].compare([4 5 6; 1 2 3])
-1
```

At `Association` compares on `key`:

```
>>> ('x' -> 3).compare('y' -> 1)
-1
```

At `String`:

```
>>> 'abc'.compare('bcd')
-1

>>> '-0'.compare('-2')
-1

>>> 'abc'.compare('abc')
0

>>> 'bcd'.compare('abc')
1
```

Comparison of strings with equal base letters and different marks:

```
>>> 'réservé'.compare('reserve')
1
```

_Subtleties_:
There are different conventions for comparison functions,
the one followed here is that _-1_ indicates less than and _+1_ indicated greater than.
The inverse is called `lexicographicOrder`.

* * *

See also: =, <, >, <=>, Compare, precedes

Guides: List Functions, Sort Functions, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicOrder.html),
_W_
[1](https://en.wikipedia.org/wiki/Lexicographic_order)

Categories: Comparing
