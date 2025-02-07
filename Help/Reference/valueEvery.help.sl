# valueEvery

- _valueEvery(aBlock:/0, aNumber | aDuration)_

Schedule _aBlock_ to be evaluated repeatedly at an interval of _aNumber_ of seconds.
Answers an identifier that can be used to `cancel` the scheduled activity.

~~~spl scheduler
let t = system.unixTimeInMilliseconds;
let k = {
	(system.unixTimeInMilliseconds - t).postLine
}.valueEvery(1.seconds);
{
	k.cancel
}.valueAfter(5.seconds)
~~~

* * *

See also: cancel, valueAfter, valueAfterWith

Categories: Scheduling
