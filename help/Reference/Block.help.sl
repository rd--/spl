# Block

The behaviour type.
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

See also: [Block Syntax], [Block Semantics]

Unicode: U+03BB λ Greek Small Letter Lamda

Categories: Behaviour, Type
