# assert

- _assert(x, s='', f:/0)_

Signal an assertion `error` with message string _s_ if the block _f_ does not evaluate to `true`.
Answers _x_.

```
>>> 1.pi.assert { true }
1.pi

>>> {
>>> 	1.pi.assert { false }
>>> }.ifError { true }
true
```

In the unary case assert that a block evaluates to `true`.
Answers nil.

```
>>> { true }.assert
nil

>>> { { false }.assert }.ifError { true }
true
```

* * *

See also: error

Guides: Control Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Assert.html)

Categories: Asserting
