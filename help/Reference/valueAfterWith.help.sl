# valueAfterWith

- _valueAfterWith(aBlock:/1, aNumber | aDuration, anObject)_

Schedule _aBlock_ to be evaluated after _aNumber_ of seconds has passed with _anObject_ as its parameter.
Answers an identifier that can be used to `cancel` the scheduled activity.

~~~
let f = { :x |
	['x', x].postLine
};
let r = (z: pi);
f(r);
f:/1.valueAfterWith(1, r);
r::z := 23
~~~

* * *

See also: cancel, valueAfter, valueEvery

Categories: Scheduling
