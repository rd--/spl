# value

- _value(f:/0)_
- _value(k→v)_
- _value(x)_
- _value(f:/1, x)_
- _value(f:/n, x₁, x₂, …)_

The three unary forms answer the answer of the no-argument block _f_:

```
>>> { 23 }.value
23
```

or the value at the `Association` _k→v_:

```
>>> ('w' -> 23).value
23
```

or the object _x_:

```
>>> 23.value
23
```

The binary form answer the result of _f(x)_.

```
>>> { :x | x * x }.value(23)
529

>>> square:/1.value(23)
529

>>> 23.square
529
```

The variant formulation of this with the arguments reversed is `in` or `with`,
so that _f.value(x)_ is equal to _x.in(f)_ or _x.with(f)_.

```
>>> 23.in(square:/1)
529
```

The ternary and quaternary forms answer the result of _f(x₁,x₂…)_:

```
>>> raisedToInteger:/2.value(23, 2)
529

>>> 23 ^ 2
529
```

It is an `error` if there are too few arguments:

```
>>> {
>>> 	{ :i | false }.value
>>> }.hasError
true
```

It is an `error` if there are too many arguments:

```
>>> {
>>> 	{ :x | false }.value(3, 4)
>>> }.hasError
true
```

There is a _non-strict_ mode of the compiler that will elide arity checks at `Block` evaluations.
This mode is off by default.

* * *

See also: $, also, Association, Block, blockValue, cull, identity, in, valueWithReturn, with

Guides: Dictionary Functions, Block Functions, Value Protocol

References:
_Smalltalk_
5.4.2.2
5.4.4.2

Categories: Accessing, Evaluating
