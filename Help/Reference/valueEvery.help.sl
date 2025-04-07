# valueEvery

- _valueEvery(aBlock:/0, interval)_

Schedule _aBlock_ to be evaluated repeatedly at _interval_,
which may be a `Duration`, or a `Quantity`, or a `Number` of seconds.
Answers an identifier that can be used to `cancel` the scheduled activity.

~~~spl scheduler
let t0 = system.absoluteTime;
let k = {
	let t = system.absoluteTime;
	(t - t0).postLine
}.valueEvery(1.seconds);
{
	k.cancel
}.valueAfter(5.seconds)
~~~

* * *

See also: cancel, valueAfter, valueAfterWith

Categories: Scheduling
