# &

- _aCollection.&_
- _aBoolean & aBlock:/0_

Nonevaluating conjunction.
true if _aBoolean_ is true and _aBlock_ evaluates to true, else false.
If _aBoolean_ is false then _aBlock_ is not evaluated.


```
>>> true & { true }
true

>>> true & { false }
false
```

The unary form of & is _allSatisfy_ of _value_:

```
>>> [1 > 0, { 2 > 1 }, { 3 > 2 }].&
true
```

The first element may also be a Block,
and the unary operator syntax may be used:

```
>>> [{ 1 > 0 }, { 2 > 1 }, { 3 > 2 }].&
true
```

The name of this operator is _ampersand_.

_Note:_
In Smalltalk the evaluating form is called _and:_ and the non-evaluating form _&_.
In Spl the names are _&_ and _&&_.

* * *

See also: |, &&, allSatisfy

Unicode: U+2227 ∧ Logical and

References:
_Apl_
[1](https://aplwiki.com/wiki/And),
_Mathematica_
[1](https://mathworld.wolfram.com/AND.html)
[2](https://reference.wolfram.com/language/ref/And.html),
_Smalltalk_
5.3.3.3

Categories: Logic, Operator
