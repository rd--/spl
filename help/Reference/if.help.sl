# if

- _if(aBoolean, whenTrue:/0, whenFalse:/0)_

If _aBoolean_ is `true` answer the result of  _whenTrue()_, else answer _whenFalse()_.

Note that the branches are not evaluated using `value`, and therefore _must_ be no-argument blocks.

Ordinarily _whenTrue_ and _whenFalse_ are literal no-argument blocks written using `Trailing Block Syntax`.

* * *

_Rationale:_

Spl follows Smalltalk in having no special purpose conditional evaluation mechanisms.

Conditionals expressions are implemented as ordinary blocks.

To delay evaluation of alternatives each must be written as a no argument block.

`Trailing Block Syntax` provides an idiomatic notation for writing conditionals.

The standard libraries write if conditions as:

```
>>> (3 > 2).if { true } { false }
true
```

where there are two branches and as either:

```
>>> (3 > 2).ifTrue { true }
true
```

or

```
>>> (3 < 2).ifFalse { true }
true
```

where there is one.

* * *

See also: ifEmpty, ifFalse, ifNil, ifNotNil, ifTrue

Categories: Conditional, Evaluation
