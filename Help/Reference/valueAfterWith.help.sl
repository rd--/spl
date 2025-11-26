# valueAfterWith

- _valueAfterWith(f:/1, n, x)_

Schedule the block _f_ to be evaluated after _n_ seconds has passed with the object _x_ as its parameter.
Answers an identifier that can be used to `cancel` the scheduled activity.

~~~spl scheduler
let f = { :x |
	['x', x].postLine
};
let r = (z: 1.pi);
f(r);
f:/1.valueAfterWith(1, r);
r['z'] := 23
~~~

* * *

See also: cancel, valueAfter, valueEvery

Guides: Scheduling Functions

Categories: Scheduling
