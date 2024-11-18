# assert

- _assert(anObject, aString, aBlock:/0)_
- _assert(α, β)_ ⇒ _assert(α, '', β)_
- _assert(α)_ ⇒ _assert(nil, α)_

Signal an assertion `error` with message _aString_ if _aBlock_ does not evaluate to `true`.
Answers _anObject_.

```
>>> 1.pi.assert { true }
1.pi

>>> { 1.pi.assert { false } }.ifError { true }
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

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Assert.html)

Categories: Asserting
