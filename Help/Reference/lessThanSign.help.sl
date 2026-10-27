# < (lessThanSign)

- _x < y_
- _x.>_

The binary form is `isLess`:

```
>>> 3 < 5
true

>>> isLess(3, 5)
true
```

The unary form is sometimes defined to be `floor`:

```
>>> let < = { :x | x.floor };
>>> 3.141.<
3

>>> floor(3.141)
3
```

The name of this operator is `lessThanSign`.

_Rationale_:
In J the floor operator is _<._,
in Apl it is _⌊_.

* * *

See also: Compare, Equal, !=, <=, <=>, =, >, >=, isLess, isLessOrEqual

Guides: Binary Operators, Comparison Functions, Sort Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Less_than),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/lt#dyadic),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Less.html),
_Smalltalk_
5.6.1.1,
_W_
[1](https://en.wikipedia.org/wiki/Converse_nonimplication)
[2](https://en.wikipedia.org/wiki/Inequality_(mathematics))

Categories: Comparing
