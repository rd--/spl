# Block Arity

Blocks have a fixed arity, as in Smalltalk.
There are no optional parameters or _rest_ arguments.

```
>>> { }.argumentCount
0

>>> { :x | x }.argumentCount
1

>>> { :x :y | (x, y) }.argumentCount
2
```

* * *

See also: Block, cull, argumentCount

Guides: Smalltalk Arity
