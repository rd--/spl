# value

- _value(anObject | aBlock:/0)_
- _value(aBlock:/1, anObject)_
- _value(aBlock:/n, anObject, ...)_

The unary form answers the answer of _aBlock_:

```
>>> { 23 }.value
23
```

or _anObject_:

```
>>> 23.value
23
```

The binary form answer the result of _aBlock(anObject)_.

```
>>> { :x | x * x }.value(23)
529

>>> squared:/1.value(23)
529

>>> 23.squared
529
```

The variant formulation of this with the arguments reversed is _in_ or _with_,
so that _f.value(x)_ is equal to _x.in(f)_ or _x.with(f)_.

```
>>> 23.in(squared:/1)
529
```

The ternary and quaternary forms answer the result of _aBlock(anObject, ...)_.

```
>>> raisedToInteger:/2.value(23, 2)
529

>>> 23 ^ 2
529
```

* * *

See also: also, cull, identity, Value Protocol, with

References:
_Smalltalk_
5.4.2.2
5.4.4.2

Categories: Evaluating
