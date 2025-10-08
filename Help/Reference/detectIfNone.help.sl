# detectIfNone

- _detectIfNone(c, f:/1, g:/0)_

Evaluate the block _f_ with each of the elements of the collection _c_ as the argument.
Answer the first element for which _f_ evaluates to `true`.
If there is no such element, evaluate and answer the exception block _g_.

```
>>> (5 .. 1).detectIfNone { :each |
>>> 	each % 7 = 0
>>> } {
>>> 	nil
>>> }
nil
```

* * *

See also: detect, detectIfFoundIfNone, findFirst, reject, select

References:
_Smalltalk_
5.7.1.12

Categories: Enumerating
