# valueAfter

- _valueAfter(f:/0, n)_

Schedule the block _f_ to be evaluated after _n_ seconds has passed.
Answers an opaque identifier that can be used to `cancel` the scheduled activity,
the type of the value is unspecified.

```
>>> let k = { }.valueAfter(1);
>>> (k.isNil, k.cancel)
(false, nil)
```

* * *

See also: cancel, valueAfterWith, valueEvery

Guides: Scheduling Functions

Categories: Scheduling
