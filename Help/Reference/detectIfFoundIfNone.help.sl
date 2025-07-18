# detectIfFoundIfNone

- _detectIfFoundIfNone(c, predicate:/1, ifFound:/1, ifNone:/0)_

Evaluate _predicate_ with each of the elements of the collection _c_ as the argument.
Answer the value of _ifFound_ at the first element for which _predicate_ evaluates to `true`.
If there is no such element, evaluate and answer _ifNone_ block.

```
>>> 5:-1:1.detectIfFoundIfNone { :each |
>>> 	each % 2 = 0
>>> } { :each |
>>> 	each ^ 3
>>> } {
>>> 	nil
>>> }
64
```

* * *

See also: detect, detectIfNone, findFirst, reject, select

Categories: Enumerating
