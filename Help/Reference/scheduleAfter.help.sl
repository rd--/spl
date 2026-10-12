# scheduleAfter

- _scheduleAfter(f/0, n)_

Schedule the block _f_ to be evaluated after _n_ seconds has passed.
Answers an opaque identifier that can be used to `cancel` the scheduled activity,
the type of the identifier is unspecified.

```
>>> let k = { }.scheduleAfter(1);
>>> (k.isNil, k.cancel)
(false, nil)
```

* * *

See also: cancel, scheduleAfterWith, scheduleAt, scheduleEvery

Guides: Scheduling Functions

Categories: Scheduling
