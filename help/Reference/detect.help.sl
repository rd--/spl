# detect

- _detect(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Answer the first element for which _aBlock_ evaluates to true.
If there is no such element, raise an error.

Find the first element matching a predicate:

```
>>> 5:1.detect { :each | each % 2 = 0 }
4

>>> 5:1.detect { :each | each * 2 <= 4 }
2
```

It is an error if no element is detected:

```
>>> { 5:1.detect { :each | each % 7 = 0 } }.ifError { true }
true
```

* * *

See also: detectIfFoundIfNone, detectIfNone, findFirst, reject, select

References:
_Smalltalk_
5.7.1.11

Categories: Enumerating
