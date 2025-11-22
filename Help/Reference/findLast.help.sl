# findLast

- _findLast([x₁ x₂ …], f:/1)_

Answer the index of the last element in the sequence _x_ that answers true to the predicate block _f_.

```
>>> [5 4 3 2 1 2 3 4 5]
>>> .findLast { :each |
>>> 	each % 3 = 0
>>> }
7
```

If no such element is found answer zero.

```
>>> [5 4 3 2 1]
>>> .findLast { :each |
>>> 	each % 7 = 0
>>> }
0
```

* * *

See also: detect, findFirst, select

Guides: List Functions

References:
_Smalltalk_
5.7.8.16

Categories: Accessing
