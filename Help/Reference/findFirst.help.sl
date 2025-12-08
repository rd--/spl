# findFirst

- _findFirst([x₁ x₂ …], f:/1)_

Answer the index of the first element in the sequence _x_ that answers `true` to the predicate block _f_.

```
>>> [5 4 3 2 1 2 3 4 5]
>>> .findFirst { :each |
>>> 	each % 3 = 0
>>> }
3
```

If no such element is found answer zero:

```
>>> [5 4 3 2 1]
>>> .findFirst { :each |
>>> 	each % 7 = 0
>>> }
0
```

* * *

See also: detect, detectIndex, findLast, select

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FirstPosition.html),
_Smalltalk_
5.7.8.15

Categories: Accessing
