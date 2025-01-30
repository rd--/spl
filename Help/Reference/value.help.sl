# value

- _value(anAssociation | anObject | aBlock:/0)_
- _value(aBlock:/1, anObject)_
- _value(aBlock:/n, anObject, ...)_

The unary form answers the answer of _aBlock_:

```
>>> { 23 }.value
23
```

or the value at an `Association`:

```
>>> ('w' -> 23).value
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

The variant formulation of this with the arguments reversed is `in` or `with`,
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

It is an error if there are too few arguments:

```
>>> { { :i | i = nil }.value }.ifError { true }
true
```

It is an error if there are too many arguments:

```
>>> { { :x | 0 - x }.value(3, 4) = -3 }.ifError { true }
true
```

There is a _non-strict_ mode of the compiler that will elide arity checks at `Block` evaluations.
This mode is off by default.

* * *

See also: also, Association, Block, cull, identity, in, valueWithReturn, with

Guides: Value Protocol

References:
_Smalltalk_
5.4.2.2
5.4.4.2

Categories: Evaluating
