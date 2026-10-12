# cancel

- _cancel(x)_

Cancel the scheduled activity associated with the opaque object _x_,
which is answered by `scheduleAfter` and related methods.
Answers `nil`.
If no scheduled activity is associated with _x_ do nothing.

Schedule a no-argument block to run in five seconds,
and then immediately cancel it:

```
>>> let f = { 'x'.printLine };
>>> let c = f/0.scheduleAfter(5);
>>> c.cancel
nil
```

* * *

See also: scheduleAfter, scheduleAfterWith, scheduleEvery

Guides: Scheduling Functions

Categories: Scheduling
