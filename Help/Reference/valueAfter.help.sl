# valueAfter

- _valueAfter(f:/0, n)_

Schedule the block _f_ to be evaluated after _n_ seconds has passed.
Answers an identifier that can be used to `cancel` the scheduled activity.

```
>>> let k = { }.valueAfter(1);
>>> (k.isPositiveInteger, k.cancel)
(true, nil)
```

* * *

See also: cancel, valueAfterWith, valueEvery

Guides: Scheduling Functions

Categories: Scheduling
