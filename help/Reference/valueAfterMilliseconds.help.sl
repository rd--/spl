# valueAfterMilliseconds

- _valueAfterMilliseconds(aBlock:/0, aNumber)_

Evaluate _aBlock_ after _aNumber_ of milliseconds has passed.
Answers an identifier that can be used to `cancel` the scheduled activity.

```
>>> let k = { nil.postLine }.valueAfterMilliseconds(1000);
>>> k.isPositiveInteger
true

>>> let k = { nil.postLine }.valueAfterMilliseconds(1000);
>>> k.cancel
nil
```

* * *

See also: cancel, valueAfter, valueAfterMillisecondsWith

Categories: Scheduling
