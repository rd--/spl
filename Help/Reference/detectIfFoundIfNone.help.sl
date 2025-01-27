# detectIfFoundIfNone

- _detectIfFoundIfNone(aCollection, predicateBlock:/1, foundBlock:/1, exceptionBlock:/0)_

Evaluate _predicateBlock_ with each of the elements of _aCollection_ as the argument.
Answer the value of _foundBlock_ at the first element for which _predicateBlock_ evaluates to true.
If there is no such element, evaluate and answer _exceptionBlock_.

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
