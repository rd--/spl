# Block

`Block` is the behaviour type.
Blocks have fixed arity and must be applied to the correct number of arguments.

```
>>> { true } . ()
true

>>> { { true } . (true) }.hasError
true

>>> { :x | x * x } . (9)
81
```

The predicate is `isBlock`:

```
>>> { }.isBlock
true
```

The arity is given by `argumentCount`:

```
>>> { }.argumentCount
0

>>> { :x | x * x }.argumentCount
1
```

The empty block answers `nil`:

```
>>> { } . ()
nil
```

The names of the arguments can be retrieved using `argumentNames`:

```
>>> { :x :y | (x * x) + (y * y) }
>>> .argumentNames
['x' 'y']
```

Blocks can be tested for identity but not equality:

```
>>> let a = { :x | x * x };
>>> let b = { :x | x * x };
>>> (a/1 == b/1, { a/1 = b/1 }.hasError)
(false, true)
```

_Rationale_:
The name _block_ is from Smalltalk.
It is used in Sᴘʟ in preference to _procedure_ or _function_.
No-argument blocks are used very extensively,
in particular to implement control structures.
Because conditional branches are implemented as blocks,
there is no _block return_ construct.
Because methods are simply blocks there is no _method return_ construct.
Instead there is the delimited control method `withReturn`.

* * *

See also: apply, argumentCount, isBlock, withReturn

Guides: Apply Syntax, Block Functions, Block Semantics, Block Syntax, Value Apply Syntax

References:
_Smalltalk_
5.4.3

Unicode: U+03BB λ Greek Small Letter Lamda

Categories: Behaviour, Type
