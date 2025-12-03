# repeat

- _repeat([x₁ x₂ …], n)_
- _repeat([x₁ x₂ …], n, m)_

Answer a sequence consisting of the sequence _x_ repeated _n_ times.
The ternary form truncates the answer to be of length at most _m_.

At `List`:

```
>>> [1 2 3].repeat(3)
[1 2 3 1 2 3 1 2 3]

>>> [1 2 3].repeat(3, 7)
[1 2 3 1 2 3 1]
```

At `String`,
answer a string consisting of the string _s_ repeated _n_ times.

A `String` of twenty-three copies of the letter _a_:

```
>>> 'a'.repeat(23)
'aaaaaaaaaaaaaaaaaaaaaaa'
```

Repeat a triplet of characters seven times:

```
>>> 'xyz'.repeat(7)
'xyzxyzxyzxyzxyzxyzxyz'
```

* * *

See also: constantArray, findRepeat, stringCatenate, stringJoin, stringRepeat

Guides: List Functions, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringRepeat.html),
