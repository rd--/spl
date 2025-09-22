# Arity Notation

Sᴘʟ is arity strict,
meaning that each `Block` and `Method` must be called with the correct number of formal parameters.

```
>>> { :x | x * x } . (3)
9

>>> { { :x | x * x } . (3, 4) }.hasError
true
```

* * *

See also: :/, Block, Method
