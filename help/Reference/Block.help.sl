# Block

`Block` is the behaviour `Type`.
Blocks have fixed arity and must be applied to the correct number of arguments.

```
>>> { true } . ()
true

>>> { { true } . (true) }.ifError { true }
true

>>> { :x | x * x } . (9)
81

>>> { { : x | x * x } . () }.ifError { true }
true
```

* * *

See also: Apply Syntax, Block Syntax, Block Semantics, Value Apply Syntax

Unicode: U+03BB λ Greek Small Letter Lamda

References:
_Smalltalk_
5.4.3

Categories: Behaviour, Type
