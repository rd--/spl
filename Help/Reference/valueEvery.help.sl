# valueEvery

- _valueEvery(f/0, n)_

Schedule the block _f_ to be evaluated repeatedly at interval _n_ seconds.
Answers an identifier that can be used to `cancel` the scheduled activity.

~~~spl scheduler
let t0 = system.absoluteTime;
let k = {
	let t = system.absoluteTime;
	(t - t0).postLine
}.valueEvery(1);
{
	k.cancel
}.valueAfter(5)
~~~

* * *

See also: cancel, valueAfter, valueAfterWith

Guides: Scheduling Functions

Categories: Scheduling
