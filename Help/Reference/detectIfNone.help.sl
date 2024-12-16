# detectIfNone

- _detectIfNone(aCollection, aBlock:/1, exceptionBlock:/0)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Answer the first element for which _aBlock_ evaluates to `true`.
If there is no such element, evaluate and answer _exceptionBlock_.

```
>>> 5:1.detectIfNone { :each |
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
