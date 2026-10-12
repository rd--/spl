# Value Protocol

In Smalltalk,
`Block` and `Association` implement `value`, in particular _value/1_, directly.
In Spl _value_ is called `apply`, and the monomorphic _value/1_ is called `nullaryApply`:

```
>>> { 1 }.apply
1

>>> { 1 }.nullaryApply
1

>>> ('x' -> 1).value
1
```

Systems that implement the `Value Protocol` also implement _value/1_ at `Object`,
meaning that every value _evaluates_ to itself unless it re-implements _value/1_.

```
>>> { 1.value }.hasError
true
```

This protocol allows writing methods that will accept either evaluated or delayed arguments.

In cases where this is not the behaviour wanted,
a `Block` can be required by using a direct form of _apply_ notation,
or the `blockNullaryApply` method.

The Sᴘʟ standard library mostly requires block arguments be blocks,
see for instance `&` and `|`.

Spl does not implement the value protocol.

* * *

See also: Association, Block, apply, blockNullaryApply, value

Guides: Apply Syntax, Value Apply Syntax
