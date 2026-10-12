# scheduleEvery

- _scheduleEvery(f/0, n)_

Schedule the block _f_ to be evaluated after _n_ seconds,
and then repeatedly at intervals of _n_ seconds.
Answers an opaque identifier that can be used to `cancel` the scheduled activity.

~~~spl scheduler
let t0 = system.absoluteTime;
let k = {
	let t = system.absoluteTime;
	(t - t0).printLine
}.scheduleEvery(1);
{
	k.cancel
}.scheduleAfter(5)
~~~

* * *

See also: cancel, scheduleAfter, scheduleAfterWith

Guides: Scheduling Functions

Categories: Scheduling
