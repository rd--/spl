# valueAfter

- _valueAfter(aBlock:/0, aNumber | aDuration)_

Schedule _aBlock_ to be evaluated after _aNumber_ of seconds has passed.
Answers an identifier that can be used to `cancel` the scheduled activity.

```
>>> let k = { }.valueAfter(1);
>>> (k.isPositiveInteger, k.cancel)
(true, nil)
```

* * *

See also: cancel, valueAfterWith, valueEvery

Categories: Scheduling
