# compare

- _compare([p₁ p₂ …], [q₁ q₂ …])_

Answer -1 if _p_ precedes _q_,
answer 0 if _p_ equals _q_,
answer 1 if _p_ succeeds _q_.

The comparison uses lexicographical ordering.

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

>>> ['a' 'b' 'c' 'd'].compare(['c' 'd'])
-1

>>> 'abcd'.compare('cd')
-1
```

At `Association` compares on `key`:

```
>>> ('x' -> 3).compare('y' -> 1)
-1
```

At `String`:


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

* * *

See also: =, <, >, <=>, precedes

Guides: List Functions, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LexicographicOrder.html)

Categories: Comparing
