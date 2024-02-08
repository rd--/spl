# &

- _and(aCollection)_
- _aBoolean & aBlock:/0_

true if _aBoolean_ is true and _aBlock_ evaluates to true, else false.
If _aBoolean_ is false then _aBlock_ is not evaluated.

Where supported _and_ is displayed as ∧.

```
>>> true & { true }
true

>>> true & { false }
false
```

The name of this operator is _and_.

```
>>> true.and { true }
true

>>> true.and { false }
false
```

The unary form of and is _allSatisfy_ of _value_:

```
>>> [1 > 0, { 2 > 1 }, { 3 > 2 }].and
true
```

The first element may also be a Block,
and the unary operator syntax may be used:

```
>>> [{ 1 > 0 }, { 2 > 1 }, { 3 > 2 }].&
true
```

_Note:_
In Smalltalk _&_ and _and:_ have different behaviour,
the former is _evaluating_ and the latter not.
In Spl _&&_ is the name of the non-evaluating form.
If _&_ were named _ampersand_ the Smalltalk behaviour could be adopted.

* * *

See also: |, &&, allSatisfy, andAnd

Unicode: U+2227 ∧ Logical and

References:
_Apl_
[1](https://aplwiki.com/wiki/And),
_Mathematica_
[1](https://mathworld.wolfram.com/AND.html)
[2](https://reference.wolfram.com/language/ref/And.html)

Categories: Logic, Operator
