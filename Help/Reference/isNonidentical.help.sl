# isNonidentical

- _p !== q_

Answers `true` if an object _p_ is not identical to another object _q_,
else `false`.
This is the non-identity operator.
It decides if two values are not identical.
The operator form is `!==`.

At `Symbol`:

```
>>> `x` !== `y`
true

>>> `x` !== `x`
false
```

At `String`:

```
>>> 'xyz' !== 'XYZ'
true

>>> 'xyz' !== 'xyz'
false
```

Numbers in different representations are not identical but may be equal or similar to each other:

```
>>> 1D !== 1
true

>>> 1D ~ 1
true

>>> 1L !== 1
true

>>> 1L = 1
true
```

* * *

See also: Equal, !=, =, ==, isIdentical

Guides: Comparison Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/UnsameQ.html),
_Smalltalk_
5.3.1.4
